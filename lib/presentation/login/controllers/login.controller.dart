import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latihan_getx/app/data/providers/auth_provider.dart';
import 'package:latihan_getx/app/validation.dart';
import 'package:latihan_getx/app/widget.dart';
import 'package:latihan_getx/infrastructure/navigation/routes.dart';

class LoginController extends GetxController {
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  var rememberMe = true.obs;
  var hiddenController = true.obs;
  var isLoading = false.obs;
  RxString errorEmail = ''.obs;
  RxString errorPass = ''.obs;

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

  void emailHandle(String value) {
    if (value.length < 3) {
      errorEmail.value = "Email too short";
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      errorEmail.value = "Invalid Email";
    } else {
      errorEmail.value = "";
    }
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

  void login(String email, String password) async {
    bool valid = true;

    if (errorEmail.value.isNotEmpty || errorPass.value.isNotEmpty) {
      valid = false;
      dialogError("Please fill in all required fields");
    } else if (email.isEmpty || password.isEmpty) {
      valid = false;
      dialogError("Please fill in all required fields");
    }

    if (valid) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 1)).then((value) => {});

      var body = {"email": email, "password": password};

      AuthProvider auth = AuthProvider();
      try {
        var response = await auth.login(body);

        if (response['token'].isNotEmpty) {
          final box = GetStorage();
          if (rememberMe.value) {
            box.write('dataUser', {
              'token': response['token'],
              'name': response['data']['name'],
              'email': response['data']['email'],
            });
          }
          dialogError("Login successfully");
          toHomePage();
        } else {
          dialogError("No account exists, check your email and password again");
        }
      } catch (e) {
        dialogError("No account exists, check your email and password again");
      }
    }
    isLoading.value = false;
  }

  void toHomePage() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => Get.offAllNamed(Routes.HOME));
  }
}
