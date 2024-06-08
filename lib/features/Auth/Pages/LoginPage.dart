import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:rupeetracker/configs/Routes/app_route_constant.dart';
import 'package:rupeetracker/features/Auth/Widgets/ElevetedButton.dart';
import 'package:rupeetracker/features/Auth/Widgets/Textformfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 200,
                child: Lottie.asset(
                    "assets/animations/Animation - 1715938144167.json"),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFormFiled(
                controller: _mobileController,
                labelText: 'Mobile',
                prefixIcon: Icons.phone,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 10) {
                    return 'Please enter valid phone number';
                  }
                  if (value != '9033006262') {
                    return 'This number is not Registerd';
                  }
                  return null;
                },
                enabled: true,
                keyboardType: TextInputType.phone,
                obscureText: false,
                onChanged: (String value) {},
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormFiled(
                controller: _passwordController,
                labelText: 'Password',
                prefixIcon: Icons.password,
                validator: (value) {
                  if (value != 'eVital@12') {
                    return 'Invalid password';
                  }
                  return null;
                },
                enabled: true,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onChanged: (String value) {},
              ),
              const SizedBox(
                height: 30,
              ),
              CustomElevetedButton(
                buttonText: 'Login',
                backgroundColor: Colors.black,
                textColor: Colors.white,
                elevation: 4,
                borderRadius: 13,
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  //   GoRouter.of(context).pushReplacementNamed(
                  //       MyappRouteConstants.homeRouteName);
                  // }
                  GoRouter.of(context)
                      .pushReplacementNamed(MyappRouteConstants.homeRouteName);
                },
                buttonWidth: 250,
                buttonHeight: 60,
                buttontextSize: 20,
              ),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                        text: "Don't have an Account? ",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black), // Apply style to this part
                      ),
                      TextSpan(
                        text: 'SignUp',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            GoRouter.of(context)
                                .pushNamed(MyappRouteConstants.signupRouteName);
                          },
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            fontWeight: FontWeight
                                .bold), // Apply different style to 'SignUp'
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
