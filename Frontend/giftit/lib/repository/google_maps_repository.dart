import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:giftit/utils/app_urls.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class GoogleMapsRepository {

  Future<Position?> getCurrentLocation() async{
    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );
  }

  Future<void> openGoogleMapsWithDirections({
  required double currentLat,
  required double currentLng,
  required double destLat,
  required double destLng,
}) async {
  final Uri url = Uri.parse(
    'https://www.google.com/maps/dir/?api=1'
    '&origin=$currentLat,$currentLng'
    '&destination=$destLat,$destLng'
    '&travelmode=driving', // or 'walking', 'bicycling'
  );

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw Exception('Could not launch Google Maps directions.');
  }
}


  Future<void> openGoogleMaps(
      double latitude, double longitude) async {

    final Uri googleMapsUrl = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
    );

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not launch Google Maps');
    }
  }


  Future<List<LatLng>> getRoutePolyline(LatLng origin, LatLng dest) async {
    final url = AppUrls.getDirectionsPolyLineUrl(
      originLatitude: origin.latitude,
      originLongitude: origin.longitude,
      destinationLatitude: dest.latitude,
      destinationLongitude: dest.longitude,
    );

    final response = await http.get(Uri.parse(url));


    final List<LatLng> routeCoords = [];

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['routes'] != null && data['routes'].isNotEmpty) {
        final points = data['routes'][0]['overview_polyline']['points'];
        final polylinePoints = PolylinePoints().decodePolyline(points);

        routeCoords.addAll(
          polylinePoints.map((e) => LatLng(e.latitude, e.longitude)),
        );
      } else {
        debugPrint('No routes found in Directions API');
      }
    } else {
      debugPrint(
          'Directions API failed with status code: ${response.statusCode}');
    }
    return routeCoords;
  }


}