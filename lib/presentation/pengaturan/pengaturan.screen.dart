import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:latihan_getx/app/widgets/bottom_navbar.dart';
import 'package:latihan_getx/infrastructure/navigation/routes.dart';

import 'controllers/pengaturan.controller.dart';

class PengaturanScreen extends GetView<PengaturanController> {
  const PengaturanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavbar(),
        appBar: AppBar(
          title: const Text('Pengaturan'),
          centerTitle: true,
        ),
        body: Obx(() => AnimatedOpacity(
              opacity: controller.isSigningOut ? 0.0 : 1.0,
              duration: const Duration(seconds: 1),
              child: Center(
                  child: Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width),
                      child: ListView(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Column(
                                  children: [
                                    const ProfilePicture(),
                                    const SizedBox(height: 10),
                                    Text(
                                      controller.nama.value.isNotEmpty
                                          ? controller.nama.value
                                          : "Account",
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                    Text(
                                      controller.email.value.isNotEmpty
                                          ? controller.email.value
                                          : "account@gmail.com",
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "General",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Column(
                                children: [
                                  CustomListTile(
                                    text: "Profil",
                                    icon: Icons.person_outline_rounded,
                                    press: () {
                                      Get.toNamed(Routes.PROFIL);
                                    },
                                  ),
                                  CustomListTile(
                                    text: "Ubah Password",
                                    icon: CupertinoIcons.lock_shield,
                                    press: () {
                                      Get.toNamed(Routes.UBAHPASS);
                                    },
                                  ),
                                  const CustomListTile(
                                    text: "Bantuan & Tentang Kami",
                                    icon: Icons.info_outline_rounded,
                                    press: null,
                                  ),
                                  CustomListTile(
                                    text: "Sign Out",
                                    icon: Icons.exit_to_app_rounded,
                                    press: () {
                                      showConfirmationDialog(
                                          controller.signOut);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ))),
            )));
  }
}

void showConfirmationDialog(out) {
  Get.dialog(
    AlertDialog(
      title: const Text('Sign Out Confirmation'),
      content: const Text('Are you sure you want to sign out?'),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            out();
          },
          child: const Text('Sign Out'),
        ),
      ],
    ),
  );
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://media.suara.com/pictures/970x544/2022/04/09/12348-naruto.jpg"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color(0xFFF5F6F9),
                    //side: BorderSide(width: 2, color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: Colors.white),
                    ),
                    //padding: EdgeInsets.symmetric(vertical: 15),
                    minimumSize: const Size(350, 50)),
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/CameraIcon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.text,
    required this.icon,
    this.press,
  });

  final String text;
  final IconData? icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      leading: Icon(icon),
      onTap: press,
    );
  }
}
