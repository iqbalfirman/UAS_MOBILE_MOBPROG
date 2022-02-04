import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkUtil extends ChangeNotifier {
  static NetworkUtil instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => instance;

  final JsonDecoder decoder = new JsonDecoder();

  Future<dynamic> get(Uri url, {Map<String, String>? headers}) {
    return http.get(url, headers: headers).then((http.Response response) {
      print(" satatus code " + response.body);
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        throw new Exception("Error while fetching data");
      }
      return decoder.convert(res);
    });
  }

  Future<dynamic> post(String url,
      {Map<String, String>? headers, body, encoding}) {
    return http
        .post(Uri.parse(url), body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      print(" satatus res body " + response.body);
      final String res = response.body;
      final int statusCode = response.statusCode;

      /*if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }*/
      if (statusCode == 200) {
        return decoder.convert(res);
      }  else {
        throw new Exception("Error while fetching data");
      }
      //return _decoder.convert(res);
    });
  }
}
