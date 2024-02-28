import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaftarController extends GetxController {
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  late TextEditingController konfirmPasswordTextController;
  var hiddenController = true.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
    emailTextController.dispose();
    passwordTextController.dispose();
    konfirmPasswordTextController.dispose();
  }

  void increment() => count.value++;
}
