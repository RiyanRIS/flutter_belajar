import 'package:get/get.dart';

import '../../../../presentation/todo_create/controllers/todo_create.controller.dart';

class TodoCreateControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoCreateController>(
      () => TodoCreateController(),
    );
  }
}
