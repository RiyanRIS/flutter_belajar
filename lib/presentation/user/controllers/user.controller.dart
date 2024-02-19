import 'dart:developer';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';

class UserController extends GetxController {
  Rx<ButtonState> buttonState = Rx(ButtonState.idle);

  late TextEditingController namaTextController;
  late TextEditingController usernameTextController;
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  @override
  void onInit() {
    super.onInit();
    namaTextController = TextEditingController();
    usernameTextController = TextEditingController();
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
  }

  void doChangePassword() async {
    buttonState.value = ButtonState.loading;
    Future.delayed(const Duration(seconds: 1)).then((value) {
      try {
        var body = {
          'nama': namaTextController.text.trim(),
          'username': usernameTextController.text.trim(),
          'email': emailTextController.text.trim(),
          'password': passwordTextController.text.trim(),
        };

        // log(body as String);
        buttonState.value = ButtonState.success;
        Future.delayed(const Duration(seconds: 2)).then((value) {
          Get.back();
        });
      } catch (e) {
        buttonState.value = ButtonState.fail;
        Get.snackbar('Gagal Ubah Password', '$e');
      }
    });

    changeStateButton();
  }

  void changeStateButton() async {
    Future.delayed(const Duration(seconds: 4))
        .then((value) => buttonState.value = ButtonState.idle);
  }
}
