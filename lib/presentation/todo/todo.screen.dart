import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latihan_getx/infrastructure/navigation/routes.dart';

import 'controllers/todo.controller.dart';

class TodoScreen extends GetView<TodoController> {
  const TodoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        centerTitle: true,
      ),
      body: Obx(
        () => (controller.isLoading.value)
            ? const Center(child: CircularProgressIndicator())
            : controller.todoItems.isEmpty
                ? const Center(child: Text('Tidak ada data'))
                : ListView.builder(
                    itemCount: controller.todoItems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(controller.todoItems[index].kegiatan),
                          subtitle: Text(controller.todoItems[index].keterangan,
                              overflow: TextOverflow.ellipsis),
                          trailing: Row(
                            mainAxisSize: MainAxisSize
                                .min, // Control icons' horizontal space
                            children: [
                              IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () => {}),
                              deleteTodo(
                                  context, controller.todoItems[index].sId)
                            ],
                          ),
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.event),
                              Text(
                                controller.todoItems[index].waktu.toString(),
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.TODO_CREATE);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> onAdd(BuildContext context) {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Add New To-Do List'),
              content: Obx(() => Column(
                    children: [
                      TextField(
                        controller: controller.kegiatanTextController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'Nama Kegiatan',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: controller.keteranganTextController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'Keterangan',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          readOnly: true,
                          controller: TextEditingController(
                              text: controller.waktuTextController.value
                                      ?.toString() ??
                                  ''),
                          decoration: InputDecoration(
                            labelText: 'Waktu',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.calendar_today),
                              onPressed: () => controller
                                  .showDateTimePickerDialog(context),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: controller.pelaksanaTextController,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          labelText: 'Pelaksana',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    (controller.isLoadingBtn.value)
                        ? () {}
                        : controller.simpan();
                    Navigator.pop(context);
                  },
                  child: (controller.isLoadingBtn.value)
                      ? const Text('Adding...')
                      : const Text('Add'),
                ),
              ],
            );
          },
        );
  }

  IconButton deleteTodo(BuildContext context, String item) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                controller.deleteToDoItem(item);
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
