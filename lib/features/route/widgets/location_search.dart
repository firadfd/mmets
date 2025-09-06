import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import '../../../core/utils/keys.dart';

class LocationSearch extends StatelessWidget {
  final String hintText;
  final TextEditingController locationController;
  final Function(double) onLatChanged;
  final Function(double) onLngChanged;
  final Function(String) onNameChanged;

  const LocationSearch({
    super.key,
    required this.locationController,
    required this.onLatChanged,
    required this.onLngChanged,
    required this.onNameChanged,
    this.hintText = "Search and Select Place",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(12.r),
        shadowColor: Colors.black.withOpacity(0.15),
        child: Container(
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: LinearGradient(
              colors: [Colors.white, Colors.blue.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: Colors.blue.shade100, width: 1),
          ),
          child: GooglePlaceAutoCompleteTextField(
            textEditingController: locationController,
            googleAPIKey: Keys.googleApiKey,
            debounceTime: 400,
            isLatLngRequired: true,
            getPlaceDetailWithLatLng: (Prediction prediction) {
              final lat = double.tryParse(prediction.lat ?? '');
              final lng = double.tryParse(prediction.lng ?? '');
              if (lat != null && lng != null) {
                locationController.text = prediction.description ?? '';
                onLatChanged(lat);
                onLngChanged(lng);
                onNameChanged(prediction.description ?? 'Unknown location');
              }
            },
            itemClick: (Prediction prediction) {
              locationController.text = prediction.description ?? '';
              // Do not call Navigator.pop or Get.back; rely on getPlaceDetailWithLatLng
            },
            boxDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            itemBuilder: (context, index, prediction) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10.r),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10.r),
                    onTap: () {
                      locationController.text = prediction.description ?? '';
                      // Do not call Navigator.pop or Get.back
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 14.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.blue.shade700,
                            size: 18.sp,
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Text(
                              prediction.description ?? "Unknown location",
                              style: GoogleFonts.poppins(
                                color: Colors.black87,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            inputDecoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                color: Colors.grey.shade600,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 10.h,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.blue.shade700,
                size: 20.sp,
              ),
              suffixIcon: locationController.text.isNotEmpty
                  ? IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey.shade700,
                  size: 18.sp,
                ),
                onPressed: () => locationController.clear(),
              )
                  : null,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}