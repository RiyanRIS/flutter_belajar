import 'package:get/get.dart';

import '../../../../presentation/daftar/controllers/daftar.controller.dart';

class DaftarControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarController>(
      () => DaftarController(),
    );
  }
}
