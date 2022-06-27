import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sokrio/ui/theme/app_colors.dart';

final InputBorder appOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.sp),
  borderSide: const BorderSide(
    color: AppColors.inputBorder,
    width: 1,
  ),
);

const InputDecoration inputDecorationWithNoBorder = InputDecoration(
  border: InputBorder.none,
  enabledBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
  focusedBorder: InputBorder.none,
  errorBorder: InputBorder.none,
);

final InputDecoration inputDecorationWithUnderline = InputDecoration(
  border: appOutlineInputBorder,
  enabledBorder: appOutlineInputBorder,
  disabledBorder: appOutlineInputBorder,
  focusedBorder: appOutlineInputBorder,
  errorBorder: appOutlineInputBorder,
);
