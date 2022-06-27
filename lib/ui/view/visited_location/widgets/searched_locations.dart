import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sokrio/model/model.dart';
import 'package:sokrio/ui/theme/app_colors.dart';
import 'package:sokrio/ui/view/visited_location/widgets/widgets.dart';

class SearchedLocations extends StatelessWidget {
  const SearchedLocations({Key? key, required this.locationDatas}) : super(key: key);
  final List<LocationData> locationDatas;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 20.w),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Text(
          'Searched Locations',
          style: GoogleFonts.poppins(
            color: AppColors.primaryDark,
            fontSize: 17.5.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 17.h),
        SizedBox(
          height: 75.w,
          child: locationDatas.isEmpty
              ? const Center(
                  child: Text(
                    'No Location found!',
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: locationDatas.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 1.w),
                      child: BuildSearchedLocation(
                        locationData: locationDatas[index],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
