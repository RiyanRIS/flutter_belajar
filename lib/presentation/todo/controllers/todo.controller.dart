import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:latihan_getx/app/widget.dart';
import 'package:latihan_getx/presentation/todo/providers/todo_provider.dart';
import 'package:latihan_getx/presentation/todo/todo_model.dart';

class TodoController extends GetxController {
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
    getAllTodoItem();
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

  void getAllTodoItem() async {
    todoItems.clear();
    isLoading.value = true;
    try {
      var data = await _todo.getTodos();
      print(data);
      data.forEach((element) {
        TodoItem _item = TodoItem.fromJson(element);
        todoItems.add(_item);
      });
      print(todoItems.map((e) => e.kegiatan));
    } catch (e) {
      print(e.toString());
    }
    isLoading.value = false;
  }

  void simpan() async {
    bool valid = true;
    String kegiatan = kegiatanTextController.text.trim();
    String keterangan = keteranganTextController.text.trim();
    String waktu = waktuTextController.value.toString().trim();
    String pelaksana = pelaksanaTextController.text.trim();

    if(kegiatan.isEmpty || waktu.isEmpty || keterangan.isEmpty || pelaksana.isEmpty){
      valid = false;
      dialogError("Please fill in all required fields");
    }

    if(valid){
      isLoadingBtn.value = true;

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
        getAllTodoItem();
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

  void deleteToDoItem(item) async {
    var respon = await _todo.deleteTodo(item);
      print(respon);
      
      if(respon['status'] == 1){
        dialogError(respon['message']);
        getAllTodoItem();
      } else {
        dialogError(respon['message']);
      }
  }
}
