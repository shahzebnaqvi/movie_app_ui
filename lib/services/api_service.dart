import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:codingchallenge/services/base_urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class API {
  static var client = http.Client();
  static Future HomeDashApi() async {
    try {
      var url = Uri.parse("${BaseUrl.baseurl}");
      var response = await http.get(url);
      print(response);
      return response;
    } catch (e) {
      print(e);
      // onError("${e}");
      print("error");
      // return onError(e, "login/Users/login");
    }
  }
}
