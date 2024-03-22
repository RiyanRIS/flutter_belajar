import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/todo_create.controller.dart';

class TodoCreateScreen extends GetView<TodoCreateController> {
  const TodoCreateScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add New To-Do List'),
          centerTitle: true,
        ),
        body: Obx(() => Column(
              children: [
                const SizedBox(
                  height: 48,
                ),
                TextField(
                  controller: controller.kegiatanTextController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Nama Kegiatan',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: controller.keteranganTextController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Keterangan',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                    readOnly: true,
                    controller: TextEditingController(
                        text:
                            controller.waktuTextController.value?.toString() ??
                                ''),
                    decoration: InputDecoration(
                      labelText: 'Waktu',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () =>
                            controller.showDateTimePickerDialog(context),
                      ),
                    )),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: controller.pelaksanaTextController,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    labelText: 'Pelaksana',
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.isLoadingBtn.isTrue ? () {} : controller.simpan();
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 48)),
                  ),
                  child: controller.isLoadingBtn.isTrue
                      ? Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.all(2.0),
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : const Text(
                          'Simpan',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ],
            )));
  }
}
