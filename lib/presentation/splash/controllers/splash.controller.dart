import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:latihan_getx/infrastructure/navigation/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    cekkoneksi();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void cekkoneksi() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      await Future.delayed(const Duration(seconds: 2)).then((value) => Get.offNamed(Routes.NOINTERNET));
    } else {
      await Future.delayed(const Duration(seconds: 2)).then((value) => Get.offNamed(Routes.LOGIN));
    }
  }

}
