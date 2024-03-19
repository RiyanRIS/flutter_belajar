import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  final Rx<DateTime?> selectedDateTime = Rx<DateTime?>(null);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void showDateTimePickerDialog(BuildContext context) {
    DatePicker.showDateTimePicker(context, showTitleActions: true,
        onChanged: (date) {
      selectedDateTime.value = date;
    }, onConfirm: (date) {
      selectedDateTime.value = date;
    }, currentTime: DateTime.now());
  }

  void deleteToDoItem(item){
    print(item);
  }
}
