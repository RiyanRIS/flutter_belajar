import 'package:get/get.dart';

import '../../../../presentation/home_backup/controllers/home_backup.controller.dart';

class HomeBackupControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeBackupController>(
      () => HomeBackupController(),
    );
  }
}
