import 'package:get/get.dart';

import '../../../../presentation/pengaturan/controllers/pengaturan.controller.dart';

class PengaturanControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengaturanController>(
      () => PengaturanController(),
    );
  }
}
