import 'package:booking_restaurant_uas/controller/home_controller.dart';
import 'package:booking_restaurant_uas/controller/pesanan_controller.dart';
import 'package:booking_restaurant_uas/utils/utility.dart';
import 'package:booking_restaurant_uas/views/widget/card_list_item.dart';
import 'package:booking_restaurant_uas/views/widget/card_list_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PesananViews extends GetView<HomeController> {
  const PesananViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(()=>
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Total Pembayaran",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    Utility.currency(controller.total.value),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.simpanPesanan();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    onPrimary: Colors.white,
                    elevation: 5,
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.4,
                        MediaQuery.of(context).size.height / 16),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                  child: controller.isloadSimpan.value
                      ? const Center(child: CircularProgressIndicator(color: Colors.white,))
                      : const Text(
                          "Pesan Sekarang",
                          style: TextStyle(fontSize: 18),
                        )),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.nama,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Nama Tidak Boleh Kosong!';
                }
              },
              decoration: InputDecoration(
                  labelText: "Nama",
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 18),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Pilih Meja",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height * 0.4),
                ),
                itemCount: controller.listTable.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.setCurrIndex(index);
                      controller.noMeja(controller.listTable[index]);
                    },
                    child: Obx(
                      () => Card(
                        color: controller.currIndexMeja.value != index
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 4,
                        child: Center(
                          child: Text(controller.listTable[index]),
                        ),
                      ),
                    ),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Item",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: controller.listItem.length,
                    itemBuilder: (BuildContext context, index) {
                      return CardListItem(
                        item: controller.listItem[index],
                      );
                    }))
          ],
        ),
      )),
    );
  }
}
