import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latihan_getx/infrastructure/navigation/routes.dart';

class HomeBackupController extends GetxController {
  dynamic userData;
  var user = ''.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getUserdata();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void toLoginPage() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => Get.offAllNamed(Routes.LOGIN));
  }

  void getUserdata(){
    userData = box.read('dataUser');
    user.value = userData['name'];
    print(user.value);
  }
}
