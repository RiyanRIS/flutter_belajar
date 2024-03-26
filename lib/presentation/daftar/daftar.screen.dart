import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihan_getx/infrastructure/navigation/routes.dart';

import 'controllers/daftar.controller.dart';

class DaftarScreen extends GetView<DaftarController> {
  const DaftarScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text(
                  'Bergabung Sekarang!',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                ),
                const SizedBox(height: 16),
                const Text('Mulai petualanganmu bersama kami, ayo gabung!'),
                const SizedBox(height: 32),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'Name',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 12),
                  Obx(
                    () => TextField(
                        onChanged: (value) {
                          controller.nameHandle(value);
                        },
                        controller: controller.nameTextController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        decoration: InputDecoration(
                            hintText: 'Enter your name',
                            border: const OutlineInputBorder(),
                            errorText: controller.errorName.value.isNotEmpty
                                ? controller.errorName.value
                                : null)),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 12),
                  Obx(
                    () => TextField(
                        onChanged: (value) {
                          controller.emailHandle(value);
                        },
                        controller: controller.emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        decoration: InputDecoration(
                            hintText: 'Enter your email',
                            border: const OutlineInputBorder(),
                            errorText: controller.errorEmail.value.isNotEmpty
                                ? controller.errorEmail.value
                                : null)),
                  ),
                  const SizedBox(height: 24),
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
                  Text(
                    'Confirm Password',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 12),
                  Obx(
                    () => TextField(
                      onChanged: (value) {
                        controller.passKonfHandle(value);
                      },
                      controller: controller.konfirmPasswordTextController,
                      autocorrect: false,
                      obscureText: controller.hiddenController.value,
                      decoration: InputDecoration(
                          hintText: "Confirm your password",
                          border: const OutlineInputBorder(),
                          errorText: controller.errorKonfPass.value.isNotEmpty
                              ? controller.errorKonfPass.value
                              : null),
                    ),
                  ),
                ]),
                const SizedBox(height: 34),
                Obx(
                  () => ElevatedButton(
                    onPressed: () {
                      if (controller.isLoading.value) {
                        () {};
                      } else {
                        controller.signup();
                      }
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 48)),
                    ),
                    child: controller.isLoading.isTrue
                        ? Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.all(2.0),
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        )
                        : const Text(
                            'Buat akun',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    text: "Sudah ada akun? ",
                    style: const TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Masuk sekarang',
                        style: const TextStyle(color: Color(0xFF3D80DE)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Future.delayed(const Duration(milliseconds: 100))
                                .then((value) => Get.offAllNamed(Routes.LOGIN));
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
