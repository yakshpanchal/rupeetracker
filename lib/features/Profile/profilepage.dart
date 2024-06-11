import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../configs/Routes/app_route_constant.dart';
import '../Auth/Widgets/ElevetedButton.dart';
class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            "Profile",
            style:TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: Center(
        child: CustomElevetedButton(
            buttonText: 'Logout',
            backgroundColor: Colors.red,
            textColor: Colors.white,
            elevation: 4,
            borderRadius: 15,
            onPressed: (){
              GoRouter.of(context).pushReplacementNamed(
                  MyappRouteConstants.SplashAppRouteName);
            },
            buttonWidth: 150,
            buttonHeight: 50,
            buttontextSize: 12,
        ),
      ),
        
    );
  }
}