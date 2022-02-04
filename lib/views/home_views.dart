import 'package:booking_restaurant_uas/controller/home_controller.dart';
import 'package:booking_restaurant_uas/models/menu_model.dart';
import 'package:booking_restaurant_uas/routes/app_pages.dart';
import 'package:booking_restaurant_uas/utils/utility.dart';
import 'package:booking_restaurant_uas/views/pesanan_views.dart';
import 'package:booking_restaurant_uas/views/widget/card_list_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViews extends GetView<HomeController> {
  const HomeViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total ', style: TextStyle(fontSize: 20)),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(Utility.currency(controller.total.value),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.to(const PesananViews());
                        controller.pesan();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        onPrimary: Colors.white,
                        elevation: 5,
                        fixedSize: Size(MediaQuery.of(context).size.width * 0.3,
                            MediaQuery.of(context).size.height / 16),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                      child: const Text(
                        "Pesan",
                        style: TextStyle(fontSize: 18),
                      )),
                ],
              )
            ],
          ),
        ),
        body: SafeArea(
            child: controller.isload.value
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: controller.listMenu.length,
                    itemBuilder: (BuildContext context, index) {
                      return CardListMenu(
                        menu: controller.listMenu[index],
                        decrement: (MenuModel menu) {
                          controller.decrementItem(menu);
                        },
                        increment: (MenuModel menu) {
                          controller.incrementItem(menu);
                        },
                      );
                    })),
      );
    });
  }
}
