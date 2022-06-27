import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sokrio/model/location_data.dart';
import 'package:sokrio/ui/shared/shared.dart';
import 'package:sokrio/ui/view/visited_location/widgets/widgets.dart';
import 'package:sokrio/utils/app_constant.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    Key? key,
    required this.locationDatas,
    required this.isSearchedLocationsEmpty,
  }) : super(key: key);

  final List<LocationData> locationDatas;
  final bool isSearchedLocationsEmpty;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: GradientText(
            'Search Result',
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFF8C68),
                Color(0xFFFF4206),
              ],
            ),
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: isSearchedLocationsEmpty
              ? AppConstant.defaultScreenSize.height - 220.h
              : AppConstant.defaultScreenSize.height - 350.h,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: locationDatas.length,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: 50.h),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 9.h),
                child: BuildSearchResult(locationData: locationDatas[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
