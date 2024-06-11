import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupeetracker/configs/Routes/app_route_constant.dart';
import 'package:rupeetracker/features/Auth/Pages/LoginPage.dart';
import 'package:rupeetracker/features/Auth/Pages/SignUpPage.dart';
import 'package:rupeetracker/features/Home/Home_main.dart';
import 'package:rupeetracker/features/Home/homepage.dart';
import 'package:rupeetracker/features/Profile/profilepage.dart';
import 'package:rupeetracker/features/Splash_Screens/Splash_Screen_beforeHomepage.dart';
import 'package:rupeetracker/features/Splash_Screens/Splash_Screen_startingApp.dart';
// first i am created a MyappRouter class

class MyappRouter {
  // then i am created a object router of it
  GoRouter router = GoRouter(
    // we need to pass some of the parameter
    // routes that taking a list

    initialLocation: "/",
    routes: <RouteBase>[
      GoRoute(
        name: MyappRouteConstants.homepageRouteName,
        path: "/",
        pageBuilder: (context, state) {
          return MaterialPage(child: HomePage());
        },
      ),
      GoRoute(
        name: MyappRouteConstants.loginRouteName,
        path: '/login',
        pageBuilder: (context, state) {
          return MaterialPage(child: Login());
        },
      ),
      GoRoute(
        name: MyappRouteConstants.signupRouteName,
        path: '/signup',
        pageBuilder: (context, state) {
          return MaterialPage(child: SignUp());
        },
      ),
      GoRoute(
        name: MyappRouteConstants.profileRouteName,
        path: '/profile',
        pageBuilder: (context, state) {
          return MaterialPage(child: ProfilePage());
        },
      ),
      GoRoute(
        name: MyappRouteConstants.SplashAppRouteName,
        path: '/splashApp',
        pageBuilder: (context, state) {
          return MaterialPage(child: SplashScreenApp());
        },
      ),
      GoRoute(
        name: MyappRouteConstants.SplashHomeRouteName,
        path: '/splashHome',
        pageBuilder: (context, state) {
          return MaterialPage(child: SplashScreenHome());
        },
      ),
      GoRoute(
        name: MyappRouteConstants.homeRouteName,
        path: '/Home',
        pageBuilder: (context, state) {
          return MaterialPage(child: Home());
        },
      ),
    ],
  );
}
