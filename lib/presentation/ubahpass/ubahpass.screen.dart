import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/ubahpass.controller.dart';

class UbahpassScreen extends GetView<UbahpassController> {
  const UbahpassScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ubah Password'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "Secure your account",
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Verifikasi Password',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 12),
                Obx(
                  () => TextField(
                    onChanged: (value) {
                      controller.passOldHandle(value);
                    },
                    controller: controller.passwordOldTextController,
                    autocorrect: false,
                    obscureText: controller.hiddenController.value,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () => controller.hiddenController.toggle(),
                          icon: controller.hiddenController.isTrue
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.remove_red_eye_outlined),
                        ),
                        hintText: "Enter your last password",
                        border: const OutlineInputBorder(),
                        errorText: controller.errorPassOld.value.isNotEmpty
                            ? controller.errorPassOld.value
                            : null),
                  ),
                ),
                Text(
                  'Password Baru',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 12),
                Obx(
                  () => TextField(
                    onChanged: (value) {
                      controller.passHandle(value);
                    },
                    controller: controller.passwordTextController,
                    autocorrect: false,
                    obscureText: controller.hidden2Controller.value,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () =>
                              controller.hidden2Controller.toggle(),
                          icon: controller.hidden2Controller.isTrue
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.remove_red_eye_outlined),
                        ),
                        hintText: "Enter your new password",
                        border: const OutlineInputBorder(),
                        errorText: controller.errorPass.value.isNotEmpty
                            ? controller.errorPass.value
                            : null),
                  ),
                ),
                Text(
                  'Konfirmasi Password',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 12),
                Obx(
                  () => TextField(
                    onChanged: (value) {
                      controller.pass2Handle(value);
                    },
                    controller: controller.password2TextController,
                    autocorrect: false,
                    obscureText: controller.hidden3Controller.value,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () =>
                              controller.hidden3Controller.toggle(),
                          icon: controller.hidden3Controller.isTrue
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.remove_red_eye_outlined),
                        ),
                        hintText: "Confirm your password",
                        border: const OutlineInputBorder(),
                        errorText: controller.errorPass2.value.isNotEmpty
                            ? controller.errorPass2.value
                            : null),
                  ),
                ),
                const SizedBox(height: 24),
                Obx(
                  () => ElevatedButton(
                    onPressed: () {
                      controller.isLoading.value ? () {} : controller.simpan();
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 48)),
                    ),
                    child: controller.isLoading.isTrue
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.0,
                          )
                        : const Text(
                            'Simpan',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
