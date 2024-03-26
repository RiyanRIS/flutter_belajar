import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/profil.controller.dart';

class ProfilScreen extends GetView<ProfilController> {
  const ProfilScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
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
                "Complete your details information",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 30),
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