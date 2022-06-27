import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sokrio/model/location_data.dart';
import 'package:sokrio/ui/shared/shared.dart';
import 'package:sokrio/ui/theme/app_colors.dart';

class BuildSearchResult extends StatelessWidget {
  const BuildSearchResult({Key? key, required this.locationData}) : super(key: key);
  final LocationData locationData;

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(decimalDigits: 0);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 1,
            offset: const Offset(-1, 3),
            color: Colors.black12.withAlpha(20),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: SizedBox(
              height: 138.h,
              width: 132.w,
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
          SizedBox(width: 20.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 19.h),
              SizedText(
                locationData.placemark?.thoroughfare ?? 'Meena Bazar',
                maxWidth: 150.w,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  color: AppColors.textGreyLight,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 11.h),
              SizedBox(
                width: 160.w,
                child: RatingBar.builder(
                  initialRating: 5,
                  minRating: 5,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemSize: 11.sp,
                  itemPadding: EdgeInsets.only(
                    right: 2.8.w,
                  ),
                  itemBuilder: (context, _) {
                    return SvgPicture.asset(
                      'assets/rating_star_icon.svg',
                    );
                  },
                  onRatingUpdate: (rating) {},
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/map_pin_icon.svg',
                    height: 14.h,
                  ),
                  SizedBox(width: 4.w),
                  SizedText(
                    locationData.placemark?.street ?? 'California saint street',
                    maxWidth: 135.w,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFA6A6A6),
                      fontSize: 9.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedText(
                    formatCurrency.format(350),
                    maxWidth: 230,
                    style: GoogleFonts.poppins(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    '/per invoice',
                    style: GoogleFonts.poppins(
                      color: AppColors.textGreyLight,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
