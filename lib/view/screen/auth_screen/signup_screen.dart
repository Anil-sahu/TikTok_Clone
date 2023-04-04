import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/view/widget/TextInputField.dart';

import '../../widget/CustomeButton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthController instance = Get.find();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height / 3,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "TikTok Clone",
                    style: TextStyle(
                        color: buttonColor,
                        fontSize: 35,
                        fontWeight: FontWeight.w900),
                  ),
                  // const Text(
                  //   "Register",
                  //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  // ),
                  // const SizedBox(
                  //   height: 25,
                  // ),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 64,
                        backgroundColor: borderColor,
                        child: Image.network(
                            "https://cdn-icons-png.flaticon.com/512/149/149071.png"),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                              onPressed: () {
                                authController.pickImage();
                              },
                              icon: const Icon(Icons.add_a_photo)))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: width - 50,
                height: height / 2,
                child: ListView(
                  children: [
                    TextInputField(
                        controller: _nameController,
                        labelText: "UserName",
                        isObs: false,
                        icon: Icons.person),
                    const SizedBox(
                      height: 25,
                    ),
                    TextInputField(
                        controller: _emailController,
                        labelText: "Email",
                        isObs: false,
                        icon: Icons.email),
                    const SizedBox(
                      height: 30,
                    ),
                    TextInputField(
                        controller: _passwordController,
                        labelText: "Password",
                        isObs: true,
                        icon: Icons.lock),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: width - 50,
                      height: 50,
                      child: CustomeButton(
                        onTap: () {
                          authController.register(
                              _nameController.text,
                              _emailController.text.toString().trim(),
                              _passwordController.text.toString().trim(),
                              authController.profileImage);
                        },
                        text: "Register",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "have an acount? ",
                          style: TextStyle(fontSize: 20),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text("Login",
                              style:
                                  TextStyle(fontSize: 20, color: buttonColor)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
