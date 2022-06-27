import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sokrio/routes/app_pages.dart';
import 'package:sokrio/ui/theme/app_colors.dart';
import 'package:sokrio/ui/theme/app_theme.dart';
import 'package:sokrio/utils/app_constant.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarColor: AppColors.black,
        systemNavigationBarDividerColor: AppColors.black,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppConstant.defaultScreenSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (c, _) => GetMaterialApp(
        title: AppConstant.appName,
        debugShowCheckedModeBanner: false,
        theme: themeData,
        initialRoute: AppRoutes.VISITED_LOCATIONS,
        getPages: AppPages.pages,
      ),
    );
  }
}

void dPrint(Object data, {Object className = '', int lineNo = 0}) {
  if (kDebugMode) {
    log('${className == '' ? '' : '[$className] '}${lineNo == 0 ? '' : '$lineNo:: '}$data');
  }
}
