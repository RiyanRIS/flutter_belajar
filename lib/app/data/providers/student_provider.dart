import 'package:get/get.dart';
import 'package:latihan_getx/app/data/models/student_model.dart';

import 'package:latihan_getx/config.dart';

class StudentProvider extends GetConnect {
  final url = '${CfgBeruang.apiUrl}/student';

  Future<Student?> getStudents() async {
    final response = await get(url);

    if (response.statusCode == 200) {
      return Student.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<Student?> getStudent(int id) async {
    final response = await get('student/$id');
    return response.body;
  }

  Future<Response<Student>> postStudent(Student student) async =>
      await post('student', student);
  Future<Response> deleteStudent(int id) async => await delete('student/$id');
}
