import 'package:booking_restaurant_uas/bindings/home_binding.dart';
import 'package:booking_restaurant_uas/bindings/pesanan_binding.dart';
import 'package:booking_restaurant_uas/views/home_views.dart';
import 'package:booking_restaurant_uas/views/pesanan_views.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const HOME = Routes.HOME;
  static const PESANAN = Routes.PESANAN;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeViews(),
        binding: HomeBinding()),
         GetPage(
        name: _Paths.HOME,
        page: () =>  const PesananViews(),
        binding: HomeBinding()),
  ];
}
