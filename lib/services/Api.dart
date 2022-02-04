import 'dart:convert';

import 'package:booking_restaurant_uas/models/menu_model.dart';
import 'package:booking_restaurant_uas/models/result_model.dart';
import 'package:booking_restaurant_uas/services/networkUtil.dart';
import 'package:flutter/foundation.dart';

class RestDataSource {
  NetworkUtil netUtil =  NetworkUtil();
  static const baseUrl = "http://192.168.124.201:8000/api";

  static const menuUrl = baseUrl + "/tampil/menu";
  static const pesananUrl = baseUrl + "/simpan/pesanan";

  Future<List<MenuModel>> getMenu() async {
    return await netUtil.get(Uri.parse(menuUrl)).then((res) {
      return compute(menuFromJson, res);
    });
  }

  Future<ResultModel> simpanPesanan(String namaPemesan, String noMeja,
      int total, List<MenuModel> item) async {
    var detBooking = jsonEncode(item.map((e) => e.toJson()).toList());

    Map<String, dynamic> body = {
      'nama_pemesan': namaPemesan,
      'no_meja': noMeja,
      'total': total.toString(),
      'menu': detBooking
    };

    print("body  " + body.toString());

    return await netUtil.post(pesananUrl, body: body).then((res) {
      return ResultModel.fromJson(res['result']);
    });
  }
}
