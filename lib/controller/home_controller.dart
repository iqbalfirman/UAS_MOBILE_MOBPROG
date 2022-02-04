import 'package:booking_restaurant_uas/controller/pesanan_controller.dart';
import 'package:booking_restaurant_uas/models/menu_model.dart';
import 'package:booking_restaurant_uas/routes/app_pages.dart';
import 'package:booking_restaurant_uas/services/Api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var pesananController = Get.put<PesananController>(PesananController());
  RestDataSource api = RestDataSource();

  var listMenu = <MenuModel>[].obs;
  var listItem = <MenuModel>[].obs;
  RxBool isload = true.obs;
  RxBool isloadSimpan = false.obs;
  RxInt total = 0.obs;
  RxString noMeja = "0".obs;

  var listTable = <String>[
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20"
  ].obs;

  RxInt currIndexMeja = 0.obs;

  TextEditingController nama = TextEditingController();

  @override
  void onInit() {
    getMenu();
    super.onInit();
  }

  void getMenu() {
    api.getMenu().then((data) {
      isload(false);
      listMenu.value = [...listMenu, ...data];
    }).catchError((onError) {
      isload(false);
    });
  }

  void incrementItem(MenuModel item) {
    print("object " + item.nama.toString());
    // int indexItem = listItem.indexWhere((data) => data.id == item.id);
    int indexMenu = listMenu.indexWhere((data) => data.id == item.id);
    // item.jml = listItem[indexItem].jml! + 1;
    // listItem[indexItem] = item;
    item.jml = listMenu[indexMenu].jml! + 1;
    listMenu[indexMenu] = item;
    totalbayar();
  }

  void decrementItem(MenuModel item) {
    if (item.jml! >= 1) {
      // int index = listItem.indexWhere((data) => data.id == item.id);
      // item.jml = listItem[index].jml! - 1;
      // listItem[index] = item;
      int indexMenu = listMenu.indexWhere((data) => data.id == item.id);
      item.jml = listMenu[indexMenu].jml! - 1;
      listMenu[indexMenu] = item;
      totalbayar();
    } else {
      Get.snackbar('Informasi', "Minimal jumlah 1",
          margin: const EdgeInsets.all(0),
          borderRadius: 0,
          colorText: Colors.white,
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void totalbayar() {
    int subtotal = 0;
    List<MenuModel> data = listMenu.where((data) => data.jml != 0).toList();

    for (var i = 0; i < data.length; i++) {
      subtotal += (data[i].harga! * data[i].jml!);
      // data[i].harga = (data[i].harga! * data[i].jml!);
    }
    total(subtotal);
    listItem(data);

    print("data " + total.value.toString());
  }

  void pesan() {
    for (var j = 0; j < listItem.length; j++) {
      listItem[j].harga = (listItem[j].harga! * listItem[j].jml!);
    }
  }

  void simpanPesanan() {
    isloadSimpan(true);
    api
        .simpanPesanan(nama.text, noMeja.value, total.value, listItem)
        .then((res) {
      isloadSimpan(false);
      Get.snackbar('Informasi', res.message ?? "",
          margin: const EdgeInsets.all(0),
          borderRadius: 0,
          colorText: Colors.white,
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM);
      Get.offAllNamed(AppPages.HOME);
    }).catchError((onError) {
      isloadSimpan(false);
      print("err " + onError.toString());
    });
  }

  void setCurrIndex(int index) {
    currIndexMeja(index);
    update();
  }
}
