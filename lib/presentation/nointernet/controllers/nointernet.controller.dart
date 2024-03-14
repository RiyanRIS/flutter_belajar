import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_getx/config.dart';
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
    const url = '${CfgBeruang.apiUrl}/';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        await Future.delayed(const Duration(seconds: 2)).then((value) => Get.offNamed(Routes.LOGIN));
      } else {
        await Future.delayed(const Duration(seconds: 2)).then((value) => Get.offNamed(Routes.NOINTERNET));
      }
    } catch (e) {
      await Future.delayed(const Duration(seconds: 2)).then((value) => Get.offNamed(Routes.NOINTERNET));
    }
  }
}
