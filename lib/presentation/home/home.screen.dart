import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihan_getx/infrastructure/navigation/routes.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(Routes.STUDENT);
          },
          child: const Text('Klik here'),
        ),
      ),
    );
  }
}
