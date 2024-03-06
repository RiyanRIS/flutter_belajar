import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihan_getx/infrastructure/navigation/routes.dart';

import 'controllers/home_backup.controller.dart';

class HomeBackupScreen extends GetView<HomeBackupController> {
  const HomeBackupScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              },
              child: const Text('Klik here'),
            ),
            Obx(
              () => Text(controller.user.value),
            )
          ],
        ),
      ),
    );
  }
}

