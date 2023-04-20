import 'package:codingchallenge/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    Future.delayed(
      Duration(seconds: 4),
      () {
        Get.offAllNamed(
          AppRoutes.homescreen,
        );
      },
    );
  }
}
