import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:property_management_system/feature/home_screen/home_screen.dart';
import 'package:property_management_system/feature/login_screen/bloc/login_screen_bloc.dart';
import 'package:property_management_system/feature/reigster/reigster_screen.dart';

import '../../core/componets/customBotton.dart';
import '../../core/componets/text_form_field.dart';
import '../../core/constant/colors.dart';
import '../../injection_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    return BlocListener(
      bloc: sl<LoginScreenBloc>(),
      listener: (ctx, state) {
        if (state is LoginScreenLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
          if (state is LoginScreenLoaded) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          }
        }
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipPath(
                  child: Container(
                    width: width,
                    height: 200,
                    color: teal,
                  ),
                  clipper: WaveClipperOne(),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: teal,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: defaultFormField(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 55.0,
                    controller: emailController,
                    hintText: 'Email',
                    prefix: Icons.email_outlined,
                    keyboard: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      if (value.length < 6) {
                        return 'too short';
                      }
                      if (value.contains('@') == false ||
                          value.contains('.') == false) {
                        return 'Invalid email format';
                      }
                      return null;
                    },
                    onTap: () {
                      return 'mm';
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: defaultFormField(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 55.0,
                    controller: passwordController,
                    hintText: 'Password',
                    onTap: () {
                      return 'mm';
                    },
                    prefix: Icons.password,
                    isPassword: isPassword,
                    suffix:
                        isPassword ? Icons.visibility : Icons.visibility_off,
                    suffixPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    keyboard: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value.isEmpty) {
                        return value.length < 8
                            ? "Enter Password 6+ characters"
                            : null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          print("object");
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: teal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Card(
                        elevation: 10,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            constraints: const BoxConstraints.expand(
                              width: 40,
                              height: 40,
                            ),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/google.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Card(
                        elevation: 10,
                        child: OutlinedButton(
                          onPressed: () {
                            print("object");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                              top: 10,
                              bottom: 10,
                            ),
                            constraints: const BoxConstraints.expand(
                              width: 30,
                              height: 30,
                            ),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    Svg('assets/images/Facebook_icon_2013.svg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Stack(children: [
                  ClipPath(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      color: teal,
                    ),
                    clipper: WaveClipperTwo(
                      flip: true,
                      reverse: true,
                    ),
                  ),
                  Positioned(
                    bottom: 80,
                    right: 30,
                    child: CustomButton(
                      text: "Login",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          sl<LoginScreenBloc>().add(LoginInScreenLoginEvent(
                              email: emailController.text,
                              password: passwordController.text));
                        }
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 30,
                    child: Column(
                      children: [
                        const Text(
                          "Don't have an Account ?",
                          style: TextStyle(
                            color: white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Acaslon Regular',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          onPressed: () {
                            Navigator.popUntil(context, (route) => false);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ReigsterScreen(),
                                ));
                          },
                          buttonWidth: width * 0.18,
                          height: 35,
                          fontSize: 14,
                          text: "Sign Up",
                        ),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
