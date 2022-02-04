import 'package:booking_restaurant_uas/controller/home_controller.dart';
import 'package:booking_restaurant_uas/controller/pesanan_controller.dart';
import 'package:get/get.dart';

class PesananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
