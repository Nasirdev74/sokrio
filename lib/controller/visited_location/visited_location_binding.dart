import 'package:get/get.dart';
import 'package:sokrio/controller/controller.dart';

class VisitedLocationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(VisitedLocationController());
  }
}
