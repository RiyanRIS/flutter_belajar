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
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.02 ),
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
                'Password',
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
                      obscureText: controller.hiddenController.value,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () =>
                                controller.hiddenController.toggle(),
                            icon: controller.hiddenController.isTrue
                                ? const Icon(Icons.remove_red_eye)
                                : const Icon(Icons.remove_red_eye_outlined),
                          ),
                          hintText: "Enter your password",
                          border: const OutlineInputBorder(),
                          errorText: controller.errorPass.value.isNotEmpty
                              ? controller.errorPass.value
                              : null),
                    ),
                  ),
              const SizedBox(height: 24),
            Obx(
                  () => ElevatedButton(
                    onPressed: () {
                      if (controller.isLoading.value) {
                        () {};
                      } else {
                        controller.simpan();
                      }
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
