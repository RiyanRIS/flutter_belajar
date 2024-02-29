import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_getx/app/data/providers/auth_provider.dart';
import 'package:latihan_getx/app/validation.dart';
import 'package:latihan_getx/app/widget.dart';
import 'package:latihan_getx/infrastructure/navigation/routes.dart';

class DaftarController extends GetxController {
  late TextEditingController nameTextController;
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  late TextEditingController konfirmPasswordTextController;
  var hiddenController = true.obs;
  var isLoading = false.obs;
  RxString errorName = ''.obs;
  RxString errorEmail = ''.obs;
  RxString errorPass = ''.obs;
  RxString errorKonfPass = ''.obs;

  @override
  void onInit() {
    super.onInit();
    nameTextController = TextEditingController();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    konfirmPasswordTextController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    nameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    konfirmPasswordTextController.dispose();
  }

  void nameHandle(String value) {
    if (value.isEmpty) {
      errorName.value = "Name is Empty";
    } else {
      errorName.value = "";
    }
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

  void passKonfHandle(String value) {
    if (value != passwordTextController.value.text) {
      errorKonfPass.value = "Password confirmation doesn't match";
    } else {
      errorKonfPass.value = "";
    }
  }

  void signup() async {
    bool valid = true;
    String nameTxt = nameTextController.text.trim();
    String emailTxt = emailTextController.text.trim();
    String passwordTxt = passwordTextController.text.trim();
    String passwordConfirmTxt = konfirmPasswordTextController.text.trim();

    if (errorName.value.isNotEmpty ||
        errorEmail.value.isNotEmpty ||
        errorPass.value.isNotEmpty ||
        errorKonfPass.value.isNotEmpty) {
      valid = false;
      dialogError("Please fill in all required fields");
    } else if (nameTxt.isEmpty ||
        emailTxt.isEmpty ||
        passwordTxt.isEmpty ||
        passwordConfirmTxt.isEmpty) {
      valid = false;
      dialogError("Please fill in all required fields");
    }

    if (valid) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2)).then((value) => {});

      var body = {
        'name': nameTxt,
        'email': emailTxt,
        'password': passwordTxt,
        'confirm_password': passwordConfirmTxt,
      };

      AuthProvider auth = AuthProvider();
      try {
        var respon = await auth.register(body);
        var errors = respon['errors'];
        if (errors.isNotEmpty) {
          Map<String, dynamic> errorMap = {};

          errors.forEach((key, value) {
            if (value is List) {
              errorMap[key] =
                  value.isNotEmpty ? value[0].toString() : 'Unknown error';
            } else {
              errorMap[key] = value.toString();
            }
          });

          if (errorMap.containsKey('name')) {
            errorName.value = errorMap['name'];
          }

          if (errorMap.containsKey('email')) {
            if (errorEmail.value == 'email sudah ada.') {
              dialogError(
                  "Your email already registered. Please log in to continue.");
              toLoginPage();
            } else {
              errorEmail.value = errorMap['email'];
            }
          }

          if (errorMap.containsKey('password')) {
            errorPass.value = errorMap['password'];
          }
        } else {
          dialogError("Registration successful. Please log in to continue.");
          toLoginPage();
        }
      } catch (e) {
        print(e);
        dialogError(e.toString());
      }

      isLoading.value = false;
    }
  }

  void toLoginPage() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Get.offAllNamed(Routes.LOGIN));
  }
}
