import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
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

    Timer(Duration(milliseconds: 5200), () {
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
            Lottie.asset('assets/animations/LoadingAnimation.json'),
            SizedBox(height: 10,),
            Center(
              child: Column(
                children: [
                  Text(
                    "Welcome to MyApp!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          offset: Offset(3, 3),
                          blurRadius: 4,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Let’s begin the adventure.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          offset: Offset(3, 3),
                          blurRadius: 4,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
