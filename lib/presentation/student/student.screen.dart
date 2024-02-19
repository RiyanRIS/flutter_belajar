import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/student.controller.dart';

class StudentScreen extends GetView<StudentController> {
  const StudentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StudentScreen'),
        centerTitle: true,
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller.students.value?.data?.length ?? 0,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var studentData = controller.students.value?.data?[index];

                return Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          color: const Color.fromRGBO(205, 213, 223, 1),
                          width: 1.0)),
                  child: Center(
                    child: Text(studentData?.namaLengkap ?? ''),
                  ),
                );
              })),
    );
  }
}
