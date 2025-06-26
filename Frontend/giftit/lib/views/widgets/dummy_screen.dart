import 'dart:async';
import 'package:flutter/material.dart';
import 'package:giftit/utils/services/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DummyScreen extends StatefulWidget {
  const DummyScreen({super.key});

  @override
  State<DummyScreen> createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng? userLatLng;
  bool isLoading = true;

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLine = {};

  List<LatLng> latlng = [
    LatLng(17.081396, 82.057048),
    LatLng(17.098936, 82.024736)
  ];

  List<LatLng> data = [];
  @override
  void initState() {
    super.initState();
    _fetchUserLocation();

    setState(() {});
  }

  Future<void> _fetchUserLocation() async {
    final location = await LocationService.requestLocationPermission();
    if (location != null) {
      userLatLng = LatLng(location.latitude, location.longitude);
      data = [userLatLng!, ...latlng];

      for (int i = 0; i < data.length; i++) {
        _markers.add(
          Marker(
            markerId: MarkerId(i.toString()),
            position: data[i],
            infoWindow: InfoWindow(
              title: i == 0 ? 'You are here' : 'NGO ${i.toString()}',
              snippet: i == 0 ? 'Current Location' : 'Nearby NGO',
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              i == 0 ? BitmapDescriptor.hueBlue : BitmapDescriptor.hueRed,
            ),
          ),
        );
      }

      // Add polyline
      _polyLine.add(
        Polyline(
          polylineId: const PolylineId('route'),
          color: Colors.green,
          width: 3,
          points: data,
        ),
      );

      setState(() {
        isLoading = false;
      });

      // 👉 Add camera bounds animation here after map is created
      // final bounds = _calculateBounds(data);
      // _controller.future.then((controller) {
      //   controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 60));
      // });
    } else {
      setState(() {
        isLoading = false;
      });
    }
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

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (userLatLng == null) {
      return const Scaffold(
        body: Center(child: Text("Failed to fetch location")),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: userLatLng!,
            zoom: 15,
          ),
          markers: Set<Marker>.of(_markers),
          mapType: MapType.satellite,
          myLocationEnabled: true,
          polylines: _polyLine,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          // onCameraMove: (CameraPosition position) {},
        ),
      ),
    );
  }
}
