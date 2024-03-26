import 'package:get/get.dart';

import 'package:latihan_getx/config.dart';

class AuthProvider extends GetConnect {
  final url = '${CfgBeruang.apiUrl}/';

  Future? register(body) async {
    var urlRegister = '${url}users';
    var req = await post(urlRegister, body);
    print(req.headers);
    return req.body;
  }

  Future? login(body) async {
    var urlLogin = '${url}auth/login';
    var req = await post(urlLogin, body);
    print(req.body);
    return req.body;
  }

  Future? updateProfil(id, body) async {
    var urlUpdateProfil = '${url}users/$id';
    var req = await put(urlUpdateProfil, body);
    print(req.body);
    return req.body;
  }
}
