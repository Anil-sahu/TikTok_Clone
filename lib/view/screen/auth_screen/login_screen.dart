import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/view/screen/auth_screen/signup_screen.dart';
import 'package:tiktok_clone/view/widget/CustomeButton.dart';
import 'package:tiktok_clone/view/widget/TextInputField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "TikTok Clone",
              style: TextStyle(
                  color: buttonColor,
                  fontSize: 35,
                  fontWeight: FontWeight.w900),
            ),
            const Text(
              "Login",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: width - 50,
              child: Column(
                children: [
                  TextInputField(
                      controller: _emailController,
                      labelText: "email",
                      isObs: false,
                      icon: Icons.email),
                  const SizedBox(
                    height: 25,
                  ),
                  TextInputField(
                      controller: _passwordController,
                      labelText: "password",
                      isObs: true,
                      icon: Icons.lock),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: width - 50,
                    height: 50,
                    child: CustomeButton(
                      onTap: () {
                        authController.login(
                            _emailController.text, _passwordController.text);
                      },
                      text: "Login",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an acount? ",
                        style: TextStyle(fontSize: 20),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const SignUpScreen());
                        },
                        child: Text("Register",
                            style: TextStyle(fontSize: 20, color: buttonColor)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
