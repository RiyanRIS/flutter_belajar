import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:latihan_getx/app/data/models/todo_model.dart';
import 'package:latihan_getx/app/data/providers/todo_provider.dart';

class TodoController extends GetxController {
  final Rx<DateTime?> selectedDateTime = Rx<DateTime?>(null);
  var todoItems = <TodoItem>[].obs;
  late TodoProvider todo;

  @override
  void onInit() {
    super.onInit();
    todo = TodoProvider();
    getAllTodoItem();
  }

  @override
  void onReady() {
    super.onReady();

  }

  @override
  void onClose() {
    super.onClose();
  }

  void getAllTodoItem() async {
    todoItems.clear();
    var getalltodo = await todo.getTodos();
    if(getalltodo.status == 1){
      var alltodo = getalltodo['data'];
      for (var value in alltodo) {
        TodoItem item = TodoItem.fromJson(value);
        todoItems.add(item);
      }
    } else {
      print(getalltodo.message);
    }
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
