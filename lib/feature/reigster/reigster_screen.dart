import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_svg/flutter_svg.dart' as flutterSvg;
import 'package:property_management_system/core/constant/assets.dart';
import 'package:property_management_system/core/helper/http_helper.dart';
import 'package:property_management_system/core/model/register_model/register_params.dart';
import 'package:property_management_system/core/model/register_model/register_response.dart';
import 'package:property_management_system/feature/home_screen/home_screen.dart';
import 'package:property_management_system/feature/login_screen/login_screen.dart';
import 'package:property_management_system/feature/reigster/bloc/reigster_screen_bloc.dart';
import 'package:property_management_system/injection_container.dart';

import 'package:property_management_system/core/componets/customBotton.dart';
import 'package:property_management_system/core/componets/text_form_field.dart';
import 'package:property_management_system/core/constant/colors.dart';

class ReigsterScreen extends StatefulWidget {
  const ReigsterScreen({Key? key}) : super(key: key);

  @override
  State<ReigsterScreen> createState() => _ReigsterScreenState();
}

class _ReigsterScreenState extends State<ReigsterScreen> {
  File? _image;
  final picker = ImagePicker();

  Future upGalleryImage(context) async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future upCameraImage(context) async {
    var pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  final formKey = GlobalKey<FormState>();
  bool isPassword = true;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Scaffold(
      body: BlocConsumer(
        bloc: sl<ReigsterScreenBloc>(),
        listener: (ctx, state) {
          if (state is ReigsterScreenLoading) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
            if (state is ReigsterScreenLoaded) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            }
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      ClipPath(
                        child: Container(
                          width: width,
                          height: 220,
                          color: teal,
                        ),
                        clipper: WaveClipperOne(),
                      ),
                      Positioned(
                        top: 50,
                        left: width / 2 - width * 0.15,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                upGalleryImage(context);
                              },
                              onLongPress: () {
                                upCameraImage(context);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    height: width * 0.3,
                                    width: width * 0.3,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.black.withOpacity(0.7)),
                                      color: white,
                                      image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: _image == null
                                            ? AssetImage(Assets.defultImage)
                                            : FileImage(File(_image!.path))
                                                as ImageProvider,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 150.0,
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: teal,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: defaultFormField(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50.0,
                      controller: usernameController,
                      hintText: 'Full Name',
                      prefix: Icons.person_rounded,
                      keyboard: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return "enter valid full name";
                        }
                      },
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: defaultFormField(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50.0,
                      controller: emailController,
                      hintText: 'Email',
                      prefix: Icons.email_outlined,
                      keyboard: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
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
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: defaultFormField(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50.0,
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
                  BlocBuilder(
                      bloc: sl<ReigsterScreenBloc>(),
                      builder: (context, state) {
                        return DropdownButton<String>(
                          value: sl<ReigsterScreenBloc>().manager
                              ? 'admin'
                              : "normal user",
                          // icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            print(newValue);
                            sl<ReigsterScreenBloc>().add(
                                ReigsterScreenDropDownValue(
                                    newValue == 'admin' ? true : false));
                          },
                          items: <String>['admin', "normal user"]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        );
                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
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
                                width: 30,
                                height: 30,
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
                                  image: Svg(
                                      'assets/images/Facebook_icon_2013.svg'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  if (state is ReigsterScreenError)
                    Text(
                      state.errorMessage,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  Stack(children: [
                    ClipPath(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 170,
                        color: teal,
                      ),
                      clipper: WaveClipperTwo(
                        flip: true,
                        reverse: true,
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      right: 30,
                      child: CustomButton(
                        text: "Register",
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            sl<ReigsterScreenBloc>().add(
                                ReigsterScreenRegisterEvent(
                                    email: emailController.text,
                                    name: usernameController.text,
                                    password: passwordController.text,
                                    image: _image));
                          }
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 45,
                      left: 30,
                      child: Column(
                        children: [
                          const Text(
                            "Alreafy have an Account ?",
                            style: TextStyle(
                              color: white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Acaslon Regular',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ));
                            },
                            buttonWidth: width * 0.18,
                            height: 35,
                            fontSize: 14,
                            text: "Log in",
                          ),
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
