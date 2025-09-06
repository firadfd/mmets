import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class RouteController extends GetxController {
  var currentPosition = LatLng(23.7925, 90.4078).obs;
  var mapController = Rx<GoogleMapController?>(null);
  var polylines = <Polyline>{}.obs;
  RxSet<Marker> markers = <Marker>{}.obs;
  TextEditingController endLocationTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _requestLocationPermission();
    _addSamplePolyline();
    _addSampleMarkers();
  }

  void setMapController(GoogleMapController controller) {
    mapController.value = controller;
  }

  Future<void> _requestLocationPermission() async {
    try {
      var status = await Permission.location.request();
      if (status.isGranted) {
        print("Location permission granted");

        Position position = await Geolocator.getCurrentPosition();
        currentPosition.value = LatLng(position.latitude, position.longitude);
      } else {
        print("Location permission denied");
      }
    } catch (e) {
      print("Error requesting permission: $e");
    }
  }

  void _addSamplePolyline() {
    final polyline = Polyline(
      polylineId: PolylineId('route_1'),
      points: [
        LatLng(23.7925, 90.4078),
        LatLng(23.7930, 90.4065),
        LatLng(23.7936, 90.4045),
      ],
      color: Colors.blue,
      width: 5,
      patterns: [PatternItem.dash(10), PatternItem.gap(5)],
    );
    polylines.add(polyline);
  }

  void _addSampleMarkers() {
    markers.add(
      Marker(
        markerId: MarkerId('gulshan'),
        position: LatLng(23.7925, 90.4078),
        infoWindow: InfoWindow(title: 'Gulshan', snippet: 'Starting point'),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId('banani'),
        position: LatLng(23.7936, 90.4045),
        infoWindow: InfoWindow(title: 'Banani', snippet: 'Destination'),
      ),
    );
  }
}

