import 'package:get/get.dart';

import '../../../../presentation/nointernet/controllers/nointernet.controller.dart';

class NointernetControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NointernetController>(
      () => NointernetController(),
    );
  }
}
