import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sokrio/ui/theme/app_colors.dart';
import 'package:sokrio/utils/app_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: AppConstant.defaultScreenSize.width.w,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 1,
            offset: const Offset(0.0, 3),
            color: Colors.black12.withAlpha(20),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 24.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/arrow_back.svg',
                  color: AppColors.textGrey,
                ),
              ],
            ),
          ),
          Text(
            'Visited Location',
            style: GoogleFonts.poppins(
              color: AppColors.primary,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            width: 24.w,
            child: SvgPicture.asset(
              'assets/notification_icon.svg',
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
