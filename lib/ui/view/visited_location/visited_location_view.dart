import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sokrio/controller/controller.dart';
import 'package:sokrio/ui/shared/shared.dart';
import 'package:sokrio/ui/theme/app_colors.dart';
import 'package:sokrio/ui/view/visited_location/widgets/widgets.dart';

class VisitedLocationView extends StatelessWidget {
  const VisitedLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => Future.value(false),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(),
            children: [
              const DefaultAppBar(),
              SizedBox(height: 20.h),
              const SearchBox(),
              SizedBox(height: 32.h),
              GetBuilder<VisitedLocationController>(
                assignId: true,
                autoRemove: false,
                builder: (controller) {
                  return controller.locationDatas.isEmpty
                      ? const Center(
                          child: Text(
                            'Empty',
                            style: TextStyle(
                              color: AppColors.primaryDark,
                              fontSize: 30,
                            ),
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: controller.searchedDatas.isNotEmpty || controller.isSearched,
                              child: SearchedLocations(
                                locationDatas: controller.searchedDatas,
                              ),
                            ),
                            SizedBox(height: 11.h),
                            SearchResult(
                              isSearchedLocationsEmpty: !(controller.searchedDatas.isNotEmpty || controller.isSearched),
                              locationDatas: controller.locationDatas,
                            ),
                          ],
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
