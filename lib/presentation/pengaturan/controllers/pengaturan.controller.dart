import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latihan_getx/infrastructure/navigation/routes.dart';

class PengaturanController extends GetxController {
  bool isSigningOut = false;

  final box = GetStorage();
  RxString nama = "".obs;
  RxString email = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    nama.value = box.read('dataUser')['nama'];
    email.value = box.read('dataUser')['email'];
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  

  void signOut() async {
    await box.remove('dataUser');
    isSigningOut = true;
    await Future.delayed(const Duration(seconds: 1));
    Get.offAllNamed(Routes.LOGIN);
  }
}
