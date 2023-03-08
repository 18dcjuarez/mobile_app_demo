import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app_demo/src/data/routes/app_routes.dart';
import 'package:mobile_app_demo/src/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getCustomThemeData(context),
      initialRoute: AppRoutes.homePage,
      routes: AppRoutes.routes,
    );
  }
}
