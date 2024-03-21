import 'package:get/get.dart';
import 'package:latihan_getx/config.dart';

import '../todo_model.dart';

class TodoProvider extends GetConnect {
  String urlTodo = '${CfgBeruang.apiUrl}/todo';

  Future getTodos() async {
    final response = await get(urlTodo);
    if (response.isOk) {
      var responses = response.body;
      return responses['data'];
    } else if (response.statusCode == 400) {
      throw Exception(response.body);
    } else {
      throw Exception('Terjadi kesalahan pada server');
    }
  }

  Future<Todo> getTodo(int id) async {
    final response = await get('todo/$id');
    return response.body;
  }

  Future postTodo(todo) async {
    var req = await post(urlTodo, todo);

    return req.body;
  }
  Future deleteTodo(String id) async {

    var req = await delete('$urlTodo/$id');
    return req.body;
  }
}
