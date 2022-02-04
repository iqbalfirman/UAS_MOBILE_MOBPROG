import 'package:booking_restaurant_uas/models/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PesananController extends GetxController {
  var listItem = <MenuModel>[].obs;
  void info(){
      Get.snackbar('Informasi', "Pesanan Berhasil di booking",
        margin: const EdgeInsets.all(0),
        borderRadius: 0,
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM);
  }
}