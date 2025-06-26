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


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class DummyScreen extends StatelessWidget {
//   final String id;
//   final String imageUrl;
//   final String name;
//   final String item;
//   final String address;

//   DummyScreen({
//     required this.id,
//     required this.imageUrl,
//     required this.name,
//     required this.item,
//     required this.address,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       Container(
//         height: 200,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.grey,
//         ),
//       ),
//       ClipPath(
//         clipper: DummyScreenClipper(),
//         child: Container(
//           height: 220,
//           width: double.infinity,
//           // padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.black,
//               gradient: LinearGradient(
//                   colors: [Colors.black, Colors.black45], stops: [0.4, 1])),
//           child: Stack(
//             children: [
//               Positioned(
//                 bottom: 9,
//                 right: 10,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Replace with actual donationId
//                     context.read<HomeScreenBloc>().add(ClaimDonation(id));
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFFC4E860),
//                     foregroundColor: Colors.black,
//                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   child: Text('Claim'),
//                 ),
//               ),
//               Align(
//                 // top: 50,
//                 // left: 40,
//                 alignment: Alignment(-0.9, -0.8),
//                 child: Container(
//                   height: 150,
//                   width: 150,
//                   decoration: BoxDecoration(
//                       // border: Border.all(width: 2,color: Colors.grey),
//                       image: DecorationImage(
//                           image: NetworkImage(imageUrl), fit: BoxFit.cover)),
//                 ),
//               ),
//               Align(
//                   alignment: Alignment(0.7, -0.6),
//                   child: Container(
//                     // color: Colors.blue,
//                     // padding: EdgeInsets.all(8),
//                     width: 170,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Name: $name",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           "Item: $item",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           "Address: $address",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ))
//             ],
//           ),
//         ),
//       ),
//     ]);
//   }
// }

// class DummyScreenClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.moveTo(0, 0); // top-left
//     path.lineTo(size.width, 0); // top-right
//     path.lineTo(size.width, size.height); // bottom-right
//     path.lineTo(270, size.height); // bottom (leave space for notch)
//     path.lineTo(160, size.height - 70);
//     path.lineTo(0, size.height - 70); // diagonal cut up
//     path.close(); // back to top-left
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
