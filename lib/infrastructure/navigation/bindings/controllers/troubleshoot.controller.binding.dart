import 'package:get/get.dart';

import '../../../../presentation/troubleshoot/controllers/troubleshoot.controller.dart';

class TroubleshootControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TroubleshootController>(
      () => TroubleshootController(),
    );
  }
}
