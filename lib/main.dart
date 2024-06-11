import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rupeetracker/configs/Routes/app_route_configration.dart';
import 'package:rupeetracker/configs/Theme/theme.dart';
import 'package:rupeetracker/firebase_options.dart';

void main() async {
  // initialized the firebase here
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // here i am using go router for navigation
      debugShowCheckedModeBanner: false,
      title: 'Application',
      // here for the theme i am using custom theme. for divece mode changes..
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      routerConfig: MyappRouter().router,
    );
  }
}
