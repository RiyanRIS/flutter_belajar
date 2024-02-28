import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihan_getx/infrastructure/navigation/routes.dart';

import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

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
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                Text(
                  'Welcome back, bray!',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                ),
                const SizedBox(height: 16),
                const Text('Login dulu, ready buat nge-todo-list in kamu!'),
                const SizedBox(height: 32),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 12),
                  Obx(() => TextField(
                        controller: controller.emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(),
                            errorText: controller.errorEmail.value.isNotEmpty
                                ? controller.errorEmail.value
                                : null),
                      )),
                  const SizedBox(height: 24),
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 12),
                  Obx(
                    () => TextField(
                      controller: controller.passwordTextController,
                      autocorrect: false,
                      obscureText: controller.hiddenController.value,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () => controller.hiddenController.toggle(),
                          icon: controller.hiddenController.isTrue
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.remove_red_eye_outlined),
                        ),
                        hintText: "Enter your password",
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                ]),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Implement forgot password
                      Get.defaultDialog(
                          title: "Informasi",
                          middleText:
                              "Tunggu ya, fitur ini akan datang segera");

                      Future.delayed(const Duration(seconds: 2)).then((value) =>
                          Get.snackbar('Hi', 'i am a modern snackbar'));
                    },
                    child: const Text(
                      'Lupa Password?',
                      style: TextStyle(color: Color(0xFF3D80DE)),
                    ),
                  ),
                ),
                Obx(
                  () => ElevatedButton(
                    onPressed: () {
                      controller.login(controller.emailTextController.text,
                          controller.passwordTextController.text);
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
                            'Masuk',
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
                    text: "Ga punya akun? ",
                    style: const TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Daftar sini',
                        style: const TextStyle(color: Color(0xFF3D80DE)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Future.delayed(const Duration(milliseconds: 100))
                                .then(
                                    (value) => Get.offAllNamed(Routes.DAFTAR));
                          },
                      ),
                    ],
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
