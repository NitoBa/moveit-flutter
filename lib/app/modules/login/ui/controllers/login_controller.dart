import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moveitflutter/app/modules/login/domain/usecases/login_usecase.dart';
import 'package:moveitflutter/app/shared/app_colors.dart';

class LoginController extends GetxController {
  final ILoginUsecase _loginUsecase;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginController(this._loginUsecase);

  RxBool _isLoadingOnLogin = false.obs;
  bool get isLoadingOnLogin => _isLoadingOnLogin.value;

  Future<void> loginAction() async {
    _isLoadingOnLogin.toggle();
    final result = await _loginUsecase(
      email: emailController.text,
      password: passwordController.text,
    );

    result.fold(
      (l) {
        _isLoadingOnLogin.toggle();
        Get.snackbar(
          "Error",
          l.message,
          colorText: Colors.white,
          backgroundColor: AppColors.redColor,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      (r) {
        _isLoadingOnLogin.toggle();
        Get.snackbar(
          "Sucesso",
          "Você está logado com sucesso",
          colorText: Colors.white,
        );
        _resetTextsFields();
      },
    );
  }

  void _resetTextsFields() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
