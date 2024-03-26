import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0; // Initialize with a default index

  void updateSelectedIndex(int index) {
    selectedIndex = index;
    update(); // Notify UI of the change
  }
}
