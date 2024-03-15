import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latihan_getx/app/data/providers/auth_provider.dart';
import 'package:latihan_getx/app/validation.dart';
import 'package:latihan_getx/app/widget.dart';

class UbahpassController extends GetxController {
  late TextEditingController passwordTextController;
  late TextEditingController password2TextController;
  late TextEditingController passwordOldTextController;
  var hiddenController = true.obs;
  var hidden2Controller = true.obs;
  var hidden3Controller = true.obs;
  var isLoading = false.obs;
  RxString errorPass = ''.obs;
  RxString errorPass2 = ''.obs;
  RxString errorPassOld = ''.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    passwordTextController = TextEditingController();
    password2TextController = TextEditingController();
    passwordOldTextController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    passwordTextController.dispose();
    password2TextController.dispose();
    passwordOldTextController.dispose();
  }

  void passHandle(String value) {
    if (value.length < 5) {
      errorPass.value = "Password too short";
    } else if (!isValidPassword(value)) {
      errorPass.value = "Weak password.";
    } else {
      errorPass.value = "";
    }
  }

  void pass2Handle(String value) {
    if (value != passwordTextController.value.text) {
      errorPass2.value = "Password confirmation doesn't match";
    } else {
      errorPass2.value = "";
    }
  }

  void passOldHandle(String value) {
    if (value.length < 5) {
      errorPassOld.value = "Password too short";
    } else if (!isValidPassword(value)) {
      errorPassOld.value = "Weak password.";
    } else {
      errorPassOld.value = "";
    }
  }

  void simpan() async {
    bool valid = true;
    String passwordTxt = passwordTextController.text.trim();
    String password2Txt = password2TextController.text.trim();
    String passwordOldTxt = passwordOldTextController.text.trim();

    if (errorPass.value.isNotEmpty ||
        errorPass2.value.isNotEmpty ||
        errorPassOld.value.isNotEmpty) {
      valid = false;
      dialogError("Please fill in all required fields");
    } else if (passwordTxt.isEmpty ||
        password2Txt.isEmpty ||
        passwordOldTxt.isEmpty) {
      valid = false;
      dialogError("Please fill in all required fields");
    }

    if (valid) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2)).then((value) => {});

      var body = {
        'password': passwordTxt,
        'password_confirm': passwordOldTxt,
      };

      AuthProvider auth = AuthProvider();
      try {
        var respon = await auth.updateProfil(box.read('dataUser')['_id'], body);
        if (respon['status'] == 0) {
          dialogError(respon['message']);
        } else {
          dialogError("Updated");
          await Future.delayed(const Duration(seconds: 2));
          Get.back();
        }
      } catch (e) {
        print(e);
        dialogError(e.toString());
      }

      isLoading.value = false;
    }
  }
}
