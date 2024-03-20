import 'package:get/get.dart';
import 'package:latihan_getx/app/data/models/todo_model.dart';

import 'package:latihan_getx/config.dart';



class TodoProvider extends GetConnect {
  final url = '${CfgBeruang.apiUrl}/';

  Future? getTodos() async {
    final response = await get('${url}todo');
    return response.body;
  }

  Future<TodoItem?> getTodo(int id) async {
    final response = await get('${url}users/$id');
    return response.body;
  }

  Future<Response<TodoItem>> postTodo(TodoItem todo) async =>
      await post('${url}todo', todo);
  Future<Response> deleteTodo(int id) async => await delete('${url}todo/$id');
}

class TodoRespons{
  int status;
  String message;
  TodoItem data;

  TodoRespons({
    required this.status,
    required this.message,
    required this.data,
  });
}
