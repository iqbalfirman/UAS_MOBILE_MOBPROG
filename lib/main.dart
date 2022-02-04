import 'package:booking_restaurant_uas/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       debugShowCheckedModeBanner: false,
            title: 'Sport Center',
            initialRoute: AppPages.HOME,
            getPages: AppPages.routes,
            theme: ThemeData(
              primarySwatch: Colors.green,
              primaryColor: const Color(0xff0faa4b),
            ),
    );
  }
}
