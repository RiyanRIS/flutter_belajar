import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:latihan_getx/app/widget.dart';
import 'package:latihan_getx/presentation/todo/providers/todo_provider.dart';
import 'package:latihan_getx/presentation/todo/todo_model.dart';

class TodoCreateController extends GetxController {
  final Rx<DateTime?> waktuTextController = Rx<DateTime?>(null);
  late TextEditingController kegiatanTextController;
  late TextEditingController keteranganTextController;
  late TextEditingController pelaksanaTextController;
  var todoItems = <TodoItem>[].obs;
  late TodoProvider _todo;
  RxBool isLoading = true.obs;
  var isLoadingBtn = false.obs;

  @override
  void onInit() {
    super.onInit();
    _todo = TodoProvider();
    kegiatanTextController = TextEditingController();
    keteranganTextController = TextEditingController();
    pelaksanaTextController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    kegiatanTextController.dispose();
    keteranganTextController.dispose();
    pelaksanaTextController.dispose();
  }

  void simpan() async {
    bool valid = true;
    String kegiatan = kegiatanTextController.text.trim();
    String keterangan = keteranganTextController.text.trim();
    String waktu = waktuTextController.toString().trim();
    String pelaksana = pelaksanaTextController.text.trim();

    if(kegiatan.isEmpty || waktu.isEmpty || keterangan.isEmpty || pelaksana.isEmpty){
      valid = false;
      dialogError("Please fill in all required fields.");
    }

    if(valid){
      isLoadingBtn.value = true;
      await Future.delayed(const Duration(seconds: 2)).then((value) => {});

      var body = {
        'kegiatan': kegiatan, 
        'keterangan': keterangan, 
        'waktu': waktu,
        'pelaksana': pelaksana
      };

      var respon = await _todo.postTodo(body);
      print(respon);

      if(respon['status'] == 1){
        dialogError(respon['message']);
      } else {
        dialogError(respon['message']);
      }

      isLoadingBtn.value = false;
    }
  }

  void showDateTimePickerDialog(BuildContext context) {
    DatePicker.showDateTimePicker(context, showTitleActions: true,
        onChanged: (date) {
      waktuTextController.value = date;
    }, onConfirm: (date) {
      waktuTextController.value = date;
    }, currentTime: DateTime.now());
  }

}
