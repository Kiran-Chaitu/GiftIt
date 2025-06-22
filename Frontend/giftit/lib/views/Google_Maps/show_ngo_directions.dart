import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/Google_Map/google_map_bloc.dart';
import 'package:giftit/bloc/Google_Map/google_map_event.dart';
import 'package:giftit/bloc/Google_Map/google_map_state.dart';
import 'package:giftit/data/API_Response/status.dart';
import 'package:giftit/views/widgets/custom_error_widget.dart';
import 'package:giftit/views/widgets/custom_loader.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowNgoDirections extends StatefulWidget {
  const ShowNgoDirections({super.key});

  @override
  State<ShowNgoDirections> createState() => _ShowNgoDirectionsState();
}

class _ShowNgoDirectionsState extends State<ShowNgoDirections> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GoogleMapBloc>().add(UpdateMapElements());
    });
  }

  LatLngBounds _calculateBounds(List<LatLng> points) {
    double minLat = points.first.latitude;
    double maxLat = points.first.latitude;
    double minLng = points.first.longitude;
    double maxLng = points.first.longitude;

    for (var p in points) {
      if (p.latitude < minLat) minLat = p.latitude;
      if (p.latitude > maxLat) maxLat = p.latitude;
      if (p.longitude < minLng) minLng = p.longitude;
      if (p.longitude > maxLng) maxLng = p.longitude;
    }

    return LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );
  }

  Future<void> animateToBounds(List<LatLng> points) async {
    final controller = await _controller.future;
    final bounds = _calculateBounds(points);
    controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 60));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<GoogleMapBloc>().add(LoadSelectedNgo(
          selectedNgo: context.read<GoogleMapBloc>().state.selectedNgoApiResponse.data!,
        ));
        context.read<GoogleMapBloc>().add(UpdateMapElements());
      },
      child: BlocBuilder<GoogleMapBloc, GoogleMapState>(
        builder: (context, state) {
          if (state.currentPosition == null ||
              state.selectedNgoApiResponse.status == Status.loading || state.isLoading) {
            return const Scaffold(
              body: Center(child: CustomLoader()),
            );
          }
      
          if (state.selectedNgoApiResponse.status == Status.failure) {
            return Scaffold(
              body: Center(
                child: CustomErrorWidget(onRetry: (){
                  context.read<GoogleMapBloc>().add(
                    LoadSelectedNgo(selectedNgo: state.selectedNgoApiResponse.data!),
                  );
                }, message: state.selectedNgoApiResponse.message!),
              ),
            );
          }
      
          final userLatLng = LatLng(
            state.currentPosition!.latitude,
            state.currentPosition!.longitude,
          );
      
          final ngo = state.selectedNgoApiResponse.data!;
          final ngoLatLng = LatLng(ngo.lat, ngo.lng);
      
          final markers = {
            Marker(
              markerId: const MarkerId('user'),
              position: userLatLng,
              infoWindow: const InfoWindow(title: 'You are here'),
              icon:
                  BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            ),
            Marker(
              markerId: const MarkerId('ngo'),
              position: ngoLatLng,
              infoWindow: InfoWindow(title: ngo.name),
              icon:
                  BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            ),
          };
      
          final polylines = {
            if (state.routePoints.isNotEmpty)
              Polyline(
                polylineId: const PolylineId('route'),
                points: state.routePoints,
                color: Colors.blue,
                width: 4,
              ),
          };
          debugPrint('length : ${polylines.length.toString()}');
          debugPrint('Route points count: ${state.routePoints.length}');
      
          WidgetsBinding.instance.addPostFrameCallback((_) {
            animateToBounds([userLatLng, ngoLatLng]);
            context.read<GoogleMapBloc>().add(UpdateMapElements());
          });
      
          return Scaffold(
            body: SafeArea(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: userLatLng,
                  zoom: 15,
                ),
                myLocationEnabled: true,
                mapType: MapType.normal,
                markers: markers,
                polylines: polylines,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}