import 'dart:convert';

import 'package:codingchallenge/models/movies_model.dart';
import 'package:codingchallenge/routes/routes.dart';
import 'package:codingchallenge/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  @override
  List productlist = ['Dune', 'Dune'];
  var Loading = false.obs;

  void onInit() async {
    getHomeApiData();
  }

  getHomeApiData() async {
    productlist = [];
    try {
      Loading.value = true;
      var response = await API.HomeDashApi();
      if (response.statusCode == 200) {
        // print('before model $response');
        var responseData = jsonDecode(response.body);
        response = MoviesModel.fromJson(responseData);
        // notifications.value = response.message;
        print(response.toJson());
        productlist.add(response);

        // for (int i = 0; i < response.length; i++) {
        //   productlist.add(response[i]);
        // }
        Loading.value = false;
        update();
      }
    } catch (e) {
      Loading.value = false;
      print(e.toString());
      update();
    }
    Loading.value = false;

    update();
  }
}
