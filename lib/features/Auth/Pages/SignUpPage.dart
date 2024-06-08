import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupeetracker/configs/Routes/app_route_constant.dart';
import 'package:rupeetracker/features/Auth/Widgets/ElevetedButton.dart';
import 'package:rupeetracker/features/Auth/Widgets/Textformfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final mobileController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'SignUp',
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      )),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              CustomTextFormFiled(
                controller: mobileController,
                labelText: 'Mobile',
                prefixIcon: Icons.phone,
                validator: (value) {},
                enabled: true,
                keyboardType: TextInputType.phone,
                obscureText: false,
                onChanged: (String value) {},
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormFiled(
                controller: passwordController,
                labelText: 'Password',
                prefixIcon: Icons.password,
                validator: (value) {},
                enabled: true,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onChanged: (String value) {},
              ),
              const SizedBox(
                height: 30,
              ),
              CustomElevetedButton(
                  buttonText: 'SignUp',
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  elevation: 4,
                  borderRadius: 13,
                  onPressed: () {
                    GoRouter.of(context)
                        .pushNamed(MyappRouteConstants.loginRouteName);
                  },
                  buttonWidth: 250,
                  buttonHeight: 60,
                  buttontextSize: 20),
            ],
          ),
        ),
      ),
    );
  }
}
