import 'package:get/get.dart';

import '../../../../presentation/todo/controllers/todo.controller.dart';

class TodoControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(
      () => TodoController(),
    );
  }
}
