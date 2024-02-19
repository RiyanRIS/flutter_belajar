import 'package:get/get.dart';
import 'package:latihan_getx/app/data/models/student_model.dart';
import 'package:latihan_getx/app/data/providers/student_provider.dart';

class StudentController extends GetxController {
  Rxn<Student> students = Rxn();
  var isLoading = true.obs;
  late StudentProvider provider;

  @override
  void onInit() {
    provider = StudentProvider();
    fetchStudent();
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

  void fetchStudent() async {
    isLoading(true);
    try {
      isLoading(true);
      var studentTemp = await provider.getStudents();

      students(studentTemp);
    } finally {
      isLoading(false);
    }
  }
}
