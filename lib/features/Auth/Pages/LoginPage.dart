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
  bool _isPasswordVisible1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login.',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  height: 300,
                  child: Image.asset('assets/images/LoginImage.png'),
                ),
                // const SizedBox(height: 20),
                CustomTextFormFiled(
                  controller: _mobileController,
                  labelText: 'Mobile',
                  prefixIcon: Icons.phone_android,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 10) {
                      return 'Please enter valid phone number';
                    }
                    if (value != '9033006262' && value != '9574709897') {
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
                // CustomTextFormFiled(
                //   controller: _passwordController,
                //   labelText: 'Password',
                //   prefixIcon: Icons.password_outlined,
                //   validator: (value) {
                //     if (value != 'eVital@12') {
                //       return 'Invalid password';
                //     }
                //     return null;
                //   },
                //   enabled: true,
                //   keyboardType: TextInputType.visiblePassword,
                //   obscureText: true,
                //   onChanged: (String value) {},
                // ),
                // const SizedBox(
                //   height: 30,
                // ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible1,
                  validator: (value) {
                    if (value != 'eVital@12' && value != 'Yaksh@512') {
                      return 'Invalid password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password_rounded,
                        color: Colors.black87,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible1
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: _isPasswordVisible1
                              ? Colors.black87
                              : Colors.black,
                          size: 22,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible1 =
                            !_isPasswordVisible1;
                          });
                        },
                      ),
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle:
                      TextStyle(color: Colors.black87)),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomElevetedButton(
                  buttonText: 'Login',
                  backgroundColor: Colors.black,
                  textColor: Colors.amberAccent,
                  elevation: 4,
                  borderRadius: 13,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      GoRouter.of(context).pushReplacementNamed(
                          MyappRouteConstants.SplashHomeRouteName);
                    }
                    // GoRouter.of(context)
                    //     .pushReplacementNamed(MyappRouteConstants.SplashHomeRouteName);
                  },
                  buttonWidth: 200,
                  buttonHeight: 60,
                  buttontextSize: 20,
                ),
                const SizedBox(height: 20),
                Text('Login with your mobile and password'),
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
                            // SnackBar(content: Text('Login with Giver mobile number and password : '));
                              // GoRouter.of(context)
                              //     .pushNamed(MyappRouteConstants.signupRouteName);
                            },
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
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
      ),
    );
  }
}
