import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sokrio/model/location_data.dart';
import 'package:sokrio/ui/shared/shared.dart';
import 'package:sokrio/ui/theme/app_colors.dart';

class BuildSearchedLocation extends StatelessWidget {
  const BuildSearchedLocation({Key? key, required this.locationData}) : super(key: key);
  final LocationData locationData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: SizedBox(
            height: 47.w,
            width: 55.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: locationData.image ??
                    'https://images.unsplash.com/photo-1562133567-b6a0a9c7e6eb?ixid=MXw3MzE3NHwwfDF8c2VhcmNofDI2fHxob3RlbHxlbnwwfHx8&ixlib=rb-1.2.1&fit=crop&h=230&w=320&crop=edges',
                progressIndicatorBuilder: (_, __, ___) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 6.h),
        SizedText(
          locationData.placemark?.thoroughfare?.split(' ').first ?? 'Cox’s Today',
          textAlign: TextAlign.center,
          maxWidth: 70.w,
          style: GoogleFonts.poppins(
            color: AppColors.textGrey,
            fontSize: 10.5.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
