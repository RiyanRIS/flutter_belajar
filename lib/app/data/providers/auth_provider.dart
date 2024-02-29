import 'package:get/get.dart';

import 'package:latihan_getx/config.dart';

class AuthProvider extends GetConnect {
  final url = '${CfgBeruang.apiUrl}/';
  var headers = {
    'Content-Type': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
  };

  Future? register(body) async {
    var urlRegister = '${url}register';
    var req = await post(urlRegister, body, headers: headers);

    if (req.isOk) {
      var res = req.body;
      return res;
    } else {
      var res = req.body;
      if (res.isNotEmpty) {
        return res;
      } else {
        throw '[Server] An error occurred. Try again later.';
      }
    }
  }

  Future? login(body) async {
    var urlRegister = '${url}login';
    var req = await post(urlRegister, body, headers: headers);

    if (req.isOk) {
      var res = req.body;
      return res;
    } else {
      var res = req.body;
      if (res.isNotEmpty) {
        return res;
      } else {
        throw '[Server] An error occurred. Try again later.';
      }
    }
  }
}
