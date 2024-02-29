import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:latihan_getx/infrastructure/navigation/routes.dart';

class NointernetController extends GetxController {

  @override
  void onInit() {
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

  void cekkoneksi() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      await Future.delayed(const Duration(seconds: 1)).then((value) => Get.snackbar('Sorry...', 'You\'re still offline, check yout internet connection'));
    } else {
      await Future.delayed(const Duration(seconds: 2)).then((value) => Get.offNamed(Routes.LOGIN));
    }
  }
}
