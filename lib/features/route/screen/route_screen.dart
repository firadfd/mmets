import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controller/route_controller.dart';
import '../widgets/location_search.dart';

class RouteScreen extends StatelessWidget {
  RouteScreen({super.key});

  final RouteController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: controller.currentPosition.value,
                zoom: 15,
              ),
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              polylines: controller.polylines,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              myLocationButtonEnabled: false,
              onMapCreated: (GoogleMapController mapController) {
                controller.setMapController(mapController);
              },
              markers: controller.markers,
            ),
             Positioned(
                left: 20.w,
                top:  35.h,
                right: 20.w,
                child: LocationSearch(
                  locationController: controller.endLocationTextController,
                  onLatChanged: (lat) {

                  },
                  onLngChanged: (lng) {

                  },
                  hintText: "Search Specific Location", onNameChanged: (String name) {  },
                ),
            ),
          ],
        );
      }),
    );
  }
}
