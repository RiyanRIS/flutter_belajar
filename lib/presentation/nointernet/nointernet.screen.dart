import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/nointernet.controller.dart';

class NointernetScreen extends GetView<NointernetController> {
  const NointernetScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const Image(image: AssetImage('assets/images/no_internet.png')),
                const SizedBox(height: 16.0,),
                const Text('Ooops...', style: TextStyle(color: Color(0xFF1E1E1E), fontSize: 24, fontWeight: FontWeight.bold)),
                const Padding(
                  padding: EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
                  child: Text("There is a connection error, Please check your internet and try again", textAlign: TextAlign.center, style: TextStyle(),),
                ),
                const Spacer(flex: 3),
                ElevatedButton(
                    onPressed: () {
                      controller.cekkoneksi();
                      // Get.toNamed(Routes.LOGIN);
                    },
                    child: const Text(
                      "Try again",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
