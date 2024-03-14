import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latihan_getx/app/data/providers/auth_provider.dart';
import 'package:latihan_getx/app/widget.dart';

class ProfilController extends GetxController {
  late TextEditingController nameTextController;
  late TextEditingController emailTextController;
  RxString errorName = ''.obs;
  RxString errorEmail = ''.obs;
  var isLoading = false.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    nameTextController = TextEditingController();
    emailTextController = TextEditingController();
    nameTextController.text = box.read('dataUser')['nama'];
    emailTextController.text = box.read('dataUser')['email'];
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

  void simpan() async {
    bool valid = true;
    String nameTxt = nameTextController.text.trim();
    String emailTxt = emailTextController.text.trim();

    if (errorName.value.isNotEmpty ||
        errorEmail.value.isNotEmpty) {
      valid = false;
      dialogError("Please fill in all required fields");
    } else if (nameTxt.isEmpty ||
        emailTxt.isEmpty) {
      valid = false;
      dialogError("Please fill in all required fields");
    }

    if (valid) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2)).then((value) => {});

      var body = {
        'nama': nameTxt,
        'email': emailTxt,
      };

      AuthProvider auth = AuthProvider();
      try {
        var respon = await auth.updateProfil(box.read('dataUser')['_id'], body);
        if (respon['status'] == 0) {
          dialogError(respon['message']);
        } else {
          box.write('dataUser', {
                '_id': respon['data']['_id'],
                'nama': respon['data']['nama'],
                'email': respon['data']['email'],
            });

          dialogError("Updated.");
        }
      } catch (e) {
        print(e);
        dialogError(e.toString());
      }
      
      isLoading.value = false;
    }
  }

}
