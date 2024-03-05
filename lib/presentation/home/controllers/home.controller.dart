import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latihan_getx/infrastructure/navigation/routes.dart';

class HomeController extends GetxController {
  var user = '';
  @override
  void onInit() {
    final box = GetStorage();
    user = box.read('dataUser');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void toLoginPage() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => Get.offAllNamed(Routes.LOGIN));
  }

}
