import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_getx/infrastructure/navigation/routes.dart';

class LoginController extends GetxController {
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  var hiddenController = true.obs;
  var isLoading = false.obs;
  RxString errorEmail = ''.obs;
  RxString errorPass = ''.obs;

  void dialogError(String msg) {
    Get.defaultDialog(
      title: "Information",
      middleText: msg,
    );
  }

  @override
  void onInit() {
    super.onInit();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailTextController.dispose();
    passwordTextController.dispose();
  }

  void emailHandle() {
    var text = emailTextController.text;
    if (text.isEmpty) {
      errorEmail.value = "Email masih kosong";
    }
  }

  void login(String email, String password) async {
    bool valid = true;
    errorEmail.value = "";
    errorPass.value = "";

    if (email.isEmpty) {
      valid = false;
      errorEmail.value = "Please enter your email";
    }

    if (password.isEmpty) {
      valid = false;
      errorPass.value = "Please enter your password";
    }

    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(email)) {
      valid = false;
      errorEmail.value = "Please enter a valid email";
    }

    if (valid) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2)).then((value) => {});
      if (email == "admin@gmail.com" && password == "admin") {
        Get.offAllNamed(Routes.HOME);
      } else {
        isLoading.value = false;
        dialogError("No account exists, check your email and password again");
      }
    }
  }
}
