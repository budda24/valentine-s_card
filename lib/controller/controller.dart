import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  final nameControler = TextEditingController();
  final box = GetStorage();
  
  @override


  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
  void onInit() async {

    super.onInit();
  }
}
