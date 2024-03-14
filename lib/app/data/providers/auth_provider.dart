import 'package:get/get.dart';

import 'package:latihan_getx/config.dart';

class AuthProvider extends GetConnect {
  final url = '${CfgBeruang.apiUrl}/';

  Future? register(body) async {
    var urlRegister = '${url}users';
    var req = await post(urlRegister, body);
    
    return req.body;
  }

  Future? login(body) async {
    var urlLogin = '${url}auth/login';
    var req = await post(urlLogin, body);

    return req.body;
  }

  Future? updateProfil(id, body) async {
    var urlUpdateProfil = '${url}users/$id';
    var req = await put(urlUpdateProfil, body);

    return req.body;
  }
}
