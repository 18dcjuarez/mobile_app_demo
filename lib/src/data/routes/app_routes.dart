import 'package:flutter/material.dart';
import 'package:mobile_app_demo/src/pages/detail/datail_page.dart';
import 'package:mobile_app_demo/src/pages/favourite/favourite_page.dart';
import 'package:mobile_app_demo/src/pages/home/home_page.dart';

class AppRoutes {
  static const homePage = 'home';
  static const favouritePage = 'favourite';
  static const detailPage = 'detail';

  static Map<String, Widget Function(BuildContext)> routes = {
    homePage: (BuildContext context) => const HomePage(),
    favouritePage: (BuildContext context) => const FavouritePage(),
    detailPage: (BuildContext context) => const DetailPage()
  };

  static Widget routeNameToWidget(String routeName) {
    switch (routeName) {
      case homePage:
        return const HomePage();
      case favouritePage:
        return const FavouritePage();
      case detailPage:
        return const DetailPage();
      default:
        return const HomePage();
    }
  }
}
