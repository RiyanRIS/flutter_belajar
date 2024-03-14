import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
    var selectedIndex = 2;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            title: "Today",
            svgScr: "assets/icons/calendar.svg",
            isActive: selectedIndex == 1,
            press: () {
            },
          ),
          BottomNavItem(
            title: "All Todos",
            svgScr: "assets/icons/gym.svg",
            isActive: selectedIndex == 2,
            press: () {
              Get.offNamed(Routes.HOME);
            },
          ),
          BottomNavItem(
            title: "Settings",
            svgScr: "assets/icons/Settings.svg",
            isActive: selectedIndex == 3,
            press: () {
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
