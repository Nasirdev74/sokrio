import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sokrio/ui/theme/app_colors.dart';
import 'package:sokrio/ui/theme/app_text_theme.dart';
import 'package:sokrio/ui/theme/input_decoration.dart';
import 'package:sokrio/utils/app_constant.dart';

final textTheme = TextTheme(
  headline1: headline1,
  headline2: headline2,
  headline3: headline3,
  headline4: headline4,
  headline5: headline5,
  headline6: headline6,
  bodyText1: bodyText1,
  bodyText2: bodyText2,
);

final appBarTheme = AppBarTheme(
  color: AppColors.primary,
  titleTextStyle: TextStyle(
    color: AppColors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    fontFamily: AppConstant.fontPoppins,
  ),
);

final inputDecorationTheme = InputDecorationTheme(
  border: appOutlineInputBorder,
  enabledBorder: appOutlineInputBorder,
  disabledBorder: appOutlineInputBorder,
  focusedBorder: appOutlineInputBorder,
  errorBorder: appOutlineInputBorder,
  alignLabelWithHint: true,
  labelStyle: TextStyle(
    fontSize: 14.sp,
    color: AppColors.textColor,
    fontFamily: AppConstant.fontPoppins,
  ),
  contentPadding: EdgeInsets.symmetric(
    horizontal: 20.sp,
    vertical: 20.sp,
  ),
  hintStyle: TextStyle(
    fontSize: 12.sp,
    color: AppColors.inputBorder,
    fontWeight: FontWeight.w700,
  ),
  suffixIconColor: AppColors.grey,
  floatingLabelStyle: TextStyle(
    fontSize: 18.sp,
    color: AppColors.textColor,
    fontFamily: AppConstant.fontPoppins,
  ),
);

const dividerThemeData = DividerThemeData(
  space: 0,
  indent: 0,
  endIndent: 0,
  thickness: 1,
);

final SwitchThemeData switchThemeData = SwitchThemeData(
  trackColor: MaterialStateProperty.all(AppColors.primary),
  thumbColor: MaterialStateProperty.all(AppColors.primary),
);

final ThemeData themeData = ThemeData(
  primaryColor: AppColors.primary,
  primaryColorDark: AppColors.primaryDark,
  primaryColorLight: AppColors.primaryLite,
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  colorScheme: const ColorScheme.light().copyWith(
    primary: AppColors.primary,
  ),
  inputDecorationTheme: inputDecorationTheme,
  appBarTheme: appBarTheme,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.black,
  ),
  cardTheme: const CardTheme(shadowColor: Colors.white70),
  textTheme: textTheme,
  switchTheme: switchThemeData,
  dividerTheme: dividerThemeData,
  fontFamily: AppConstant.fontPoppins,
);
