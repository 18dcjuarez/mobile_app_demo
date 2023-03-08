import 'package:flutter/material.dart';
import 'package:mobile_app_demo/src/theme/styles.dart';

ThemeData getCustomThemeData(BuildContext context) {
  return ThemeData(
    appBarTheme: const AppBarTheme(centerTitle: true),
    primaryColor: CustomColors.mainBlue,
    textTheme: Theme.of(context).textTheme.copyWith(
          //deal title
          headline1: const TextStyle(
            color: CustomColors.colorWhite,
            fontSize: 28,
            fontWeight: FontWeight.w600,
            height: 1.6,
          ),
          //app bar title
          headline3: const TextStyle(
            color: CustomColors.colorWhite,
            fontWeight: FontWeight.w400,
            fontSize: 24,
          ),
          headline4: const TextStyle(
            color: CustomColors.colorWhite,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
          subtitle1: const TextStyle(
            color: CustomColors.colorWhite,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          bodyText1: const TextStyle(
            color: CustomColors.colorWhite,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.3,
          ),
          bodyText2: const TextStyle(
            color: CustomColors.colorWhite,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.3,
          ),
          button: const TextStyle(
            color: CustomColors.mainOrange,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
  );
}
