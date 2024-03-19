import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  EnvironmentsBadge({required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.USER,
      page: () => UserScreen(),
      binding: UserControllerBinding(),
    ),
    GetPage(
      name: Routes.TROUBLESHOOT,
      page: () => const TroubleshootScreen(),
      binding: TroubleshootControllerBinding(),
    ),
    GetPage(
      name: Routes.STUDENT,
      page: () => const StudentScreen(),
      binding: StudentControllerBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginControllerBinding(),
    ),
    GetPage(
      name: Routes.DAFTAR,
      page: () => const DaftarScreen(),
      binding: DaftarControllerBinding(),
    ),
    GetPage(
      name: Routes.NOINTERNET,
      page: () => const NointernetScreen(),
      binding: NointernetControllerBinding(),
    ),
    GetPage(
      name: Routes.HOME_BACKUP,
      page: () => const HomeBackupScreen(),
      binding: HomeBackupControllerBinding(),
    ),
    GetPage(
      name: Routes.DETAILS,
      page: () => const DetailsScreen(),
      binding: DetailsControllerBinding(),
    ),
    GetPage(
      name: Routes.PENGATURAN,
      page: () => const PengaturanScreen(),
      binding: PengaturanControllerBinding(),
    ),
    GetPage(
      name: Routes.PROFIL,
      page: () => const ProfilScreen(),
      binding: ProfilControllerBinding(),
    ),
    GetPage(
      name: Routes.UBAHPASS,
      page: () => const UbahpassScreen(),
      binding: UbahpassControllerBinding(),
    ),
    GetPage(
      name: Routes.TODO,
      page: () => const TodoScreen(),
      binding: TodoControllerBinding(),
    ),
  ];
}
