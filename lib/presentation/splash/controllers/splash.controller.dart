import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_getx/config.dart';
import 'package:latihan_getx/infrastructure/navigation/routes.dart';

class SplashController extends GetxController {
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    redirectKemana();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> isConnected() async {
    const url = '${CfgBeruang.apiUrl}/';

    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  void redirectKemana() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) => {});
    if (cekIsLogin()) {
      Get.offNamed(Routes.HOME);
    } else if (await isConnected()) {
      Get.offNamed(Routes.LOGIN);
    } else {
      Get.offNamed(Routes.NOINTERNET);
    }
  }

  bool cekIsLogin() {
    var id = box.read('dataUser')?['_id'];
    return id != null;
  }
}
