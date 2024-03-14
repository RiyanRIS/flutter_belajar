import 'package:get/get.dart';

import '../../../../presentation/ubahpass/controllers/ubahpass.controller.dart';

class UbahpassControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UbahpassController>(
      () => UbahpassController(),
    );
  }
}
