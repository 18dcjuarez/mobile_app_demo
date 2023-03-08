import 'package:flutter/material.dart';
import 'package:mobile_app_demo/src/pages/home/home_page.dart';

class AppRoutes {
  static const homePage = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {
    homePage: (BuildContext context) => const HomePage(),
  };

  static Widget routeNameToWidget(String routeName) {
    switch (routeName) {
      case homePage:
        return const HomePage();
      default:
        return const HomePage();
    }
  }
}
