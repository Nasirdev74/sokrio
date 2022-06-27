import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sokrio/controller/controller.dart';
import 'package:sokrio/ui/theme/input_decoration.dart';
import 'package:sokrio/utils/app_constant.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final visitedLocationController = Get.find<VisitedLocationController>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SizedBox(
        height: 42.h,
        child: Container(
          padding: EdgeInsets.only(left: 15.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                spreadRadius: 1,
                offset: const Offset(1, 1.5),
                color: Colors.black12.withAlpha(20),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: AppConstant.defaultScreenSize.width - 120.w,
                child: TextFormField(
                  controller: visitedLocationController.searchTextController,
                  textCapitalization: TextCapitalization.words,
                  onEditingComplete: () => visitedLocationController.searchLocation(),
                  onFieldSubmitted: (_) => visitedLocationController.searchLocation(),
                  decoration: inputDecorationWithNoBorder.copyWith(
                    isDense: true,
                    contentPadding: const EdgeInsets.only(),
                    hintText: 'Search locations',
                    hintStyle: GoogleFonts.poppins(
                      color: const Color(0xFFAFAFAF),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => visitedLocationController.searchLocation(),
                child: Container(
                  width: 50.w,
                  padding: EdgeInsets.only(
                    top: 5.w,
                    bottom: 5.w,
                    left: 10.w,
                    right: 15.w,
                  ),
                  child: SvgPicture.asset(
                    'assets/search_icon.svg',
                    width: 20.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
