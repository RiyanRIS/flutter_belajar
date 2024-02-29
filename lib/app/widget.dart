import 'package:get/get.dart';

void dialogError(String msg) {
  Get.defaultDialog(
    title: "Information",
    middleText: msg,
  );
}
