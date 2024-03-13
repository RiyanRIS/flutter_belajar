import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:latihan_getx/infrastructure/navigation/routes.dart';
import 'package:latihan_getx/presentation/home/widgets/bottom_navbar.dart';
import 'package:latihan_getx/presentation/home/widgets/category_card.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: const BottomNavbar(),
        body: Stack(
          children: <Widget>[
            Container(
              // Here the height of the container is 45% of our total height
              height: size.height * .45,
              decoration: const BoxDecoration(
                color: Color(0xFFF5CEB8),
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF2BEA1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset("assets/icons/menu.svg"),
                      ),
                    ),
                    Text("Good Morning \nRiyan Ris",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(29.5),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          icon: SvgPicture.asset("assets/icons/search.svg"),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          CategoryWidget(
                              title: "Diet Recommendation",
                              svgScr: "assets/icons/Hamburger.svg",
                              onPress: () {}),
                          CategoryWidget(
                              title: "Kegel Exercises",
                              svgScr: "assets/icons/Excrecises.svg",
                              onPress: () {}),
                          CategoryWidget(
                              title: "Meditation",
                              svgScr: "assets/icons/Meditation.svg",
                              onPress: () {
                                Get.toNamed(Routes.DETAILS);
                              }),
                          CategoryWidget(
                              title: "Yoga",
                              svgScr: "assets/icons/yoga.svg",
                              onPress: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
