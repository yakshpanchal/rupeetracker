import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:rupeetracker/configs/Routes/app_route_configration.dart';
import 'package:rupeetracker/configs/Routes/app_route_constant.dart';

class SplashScreenHome extends StatefulWidget {
  const SplashScreenHome({super.key});

  @override
  State<SplashScreenHome> createState() => _SplashScreenHomeState();
}

class _SplashScreenHomeState extends State<SplashScreenHome> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      GoRouter.of(context)
          .pushReplacementNamed(MyappRouteConstants.homeRouteName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 70,
            child: Lottie.asset('assets/animations/Welcome2Animation.json'),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Lottie.asset('assets/animations/LoadingAnimation.json'),
            SizedBox(height: 10,),
            Center(
              child: Text(
                "Loading HomePage...",
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
            ),
          ],
        ),
      ),
    );
  }
}
