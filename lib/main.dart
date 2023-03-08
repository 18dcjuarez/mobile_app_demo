import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_app_demo/src/pages/app/app.dart';
import 'package:mobile_app_demo/src/store/photo/photo_store.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  // runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        Provider<PhotoStore>(create: (_) => PhotoStore()),
      ],
      child: const App(),
    ),
  );
}
