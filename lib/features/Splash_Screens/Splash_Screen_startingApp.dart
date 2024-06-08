import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:rupeetracker/configs/Routes/app_route_configration.dart';
import 'package:rupeetracker/configs/Routes/app_route_constant.dart';

class SplashScreenApp extends StatefulWidget {
  const SplashScreenApp({super.key});

  @override
  State<SplashScreenApp> createState() => _SplashScreenAppState();
}

class _SplashScreenAppState extends State<SplashScreenApp> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 4), () {
      GoRouter.of(context)
          .pushReplacementNamed(MyappRouteConstants.loginRouteName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/animations/Welcome2Animation.json"),
          ],
        ),
      ),
    );
  }
}
