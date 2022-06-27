import 'package:get/get.dart';
import 'package:sokrio/controller/binding.dart';
import 'package:sokrio/ui/view/view.dart';

part './app_routes.dart';

abstract class AppPages {
  static const trzm = Transition.zoom;
  static const trrl = Transition.rightToLeft;
  static const trD2 = Duration(milliseconds: 200);
  static const trD3 = Duration(milliseconds: 300);
  static const trD5 = Duration(milliseconds: 500);
  static final pages = <GetPage>[
    GetPage(name: AppRoutes.VISITED_LOCATIONS, page: () => const VisitedLocationView(), binding: VisitedLocationBinding(), transition: trzm, transitionDuration: trD3),
  ];
}
