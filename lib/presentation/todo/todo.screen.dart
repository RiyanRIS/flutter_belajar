import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihan_getx/presentation/todo/widgets/todo_item.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'controllers/todo.controller.dart';

class TodoScreen extends GetView<TodoController> {
  const TodoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID');
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          String formattedTime =
              DateFormat.yMMMMd('id_ID').format(todoItems[index].waktu);
          return Card(
            child: ListTile(
              title: Text(todoItems[index].kegiatan),
              subtitle: Text(todoItems[index].keterangan),
              trailing: Row(
                mainAxisSize:
                    MainAxisSize.min, // Control icons' horizontal space
                children: [
                  IconButton(icon: const Icon(Icons.edit), onPressed: () => {}),
                  deleteTodo(context, index)
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add New To-Do List'),
                content: Obx(() => Column(
                      children: [
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Nama Kegiatan',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Keterangan',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            readOnly: true,
                            controller: TextEditingController(
                                text: controller.selectedDateTime.value
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
                        const TextField(
                          decoration: InputDecoration(
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
                      // Simpan data to-do list baru
                      Navigator.pop(context);
                      // Tambahkan item baru ke list view
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  IconButton deleteTodo(BuildContext context, int index) {
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
                controller.deleteToDoItem(todoItems[index]);
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
