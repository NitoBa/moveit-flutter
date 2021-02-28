import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/app_colors.dart';
import '../../../../shared/services/local_storage/i_local_storage.dart';

class HomeController extends GetxController {
  final ILocalStorage _iLocalStorage;
  String userLogged;
  HomeController(this._iLocalStorage);

  @override
  void onInit() async {
    _checkIfThereAreUserLogged();
    super.onInit();
  }

  _checkIfThereAreUserLogged() async {
    userLogged = await _iLocalStorage.getByKey('user_logged') ?? "Empty";
    if (userLogged == "Empty") {
      Get.snackbar(
        "Error",
        "There are not user logged. Please login first!",
        colorText: Colors.white,
        backgroundColor: AppColors.redColor,
        snackPosition: SnackPosition.BOTTOM,
      );
      await 2.delay();
      Get.offNamedUntil('/login', (route) => false);
    } else {
      print(userLogged);
    }
  }
}
