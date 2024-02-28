import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_getx/infrastructure/navigation/routes.dart';

class LoginController extends GetxController {
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  var hiddenController = true.obs;

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

  void login(String email, String password) async {
    if(email.isNotEmpty || password.isNotEmpty){
      if(RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(email)){
          if(password.length > 3){
            if(email == "admin@gmail.com" && password == "admin"){
              Get.toNamed(Routes.HOME);
            } else {
              dialogError("No account exists, check your email and password again");
            }
          } else {
            dialogError("Password too short");
          }
        } else {
          dialogError("Please enter a valid email");
        }
    } else {
      dialogError("Please enter your email and password");
    }
  }
}
