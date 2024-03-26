import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:latihan_getx/app/widgets/bottom_nav_controller.dart';
import 'package:latihan_getx/infrastructure/navigation/routes.dart';
import 'package:latihan_getx/infrastructure/theme/contant.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({
    super.key,
  });

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController()); 
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            title: "Todos",
            svgScr: "assets/icons/calendar.svg",
            isActive: controller.selectedIndex == 1,
            press: () {
              controller.updateSelectedIndex(1);
              Get.offNamed(Routes.TODO);
            },
          ),
          BottomNavItem(
            title: "Home",
            svgScr: "assets/icons/gym.svg",
            isActive: controller.selectedIndex == 2,
            press: () {
              controller.updateSelectedIndex(2);
              Get.offNamed(Routes.HOME);
            },
          ),
          BottomNavItem(
            title: "Settings",
            svgScr: "assets/icons/Settings.svg",
            isActive: controller.selectedIndex == 3,
            press: () {
              controller.updateSelectedIndex(3);
              Get.offNamed(Routes.PENGATURAN);
            },
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.title,
    required this.svgScr,
    required this.press,
    this.isActive = false,
  });

  final bool isActive;
  final String title;
  final String svgScr;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
            svgScr,
            color: isActive ? kActiveIconColor : kTextColor,
          ),
          Text(
            title,
            style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
          ),
        ],
      ),
    );
  }
}
