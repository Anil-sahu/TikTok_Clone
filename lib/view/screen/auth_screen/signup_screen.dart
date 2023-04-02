import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/view/widget/TextInputField.dart';

import '../../widget/CustomeButton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "TikTok Clone",
              style: TextStyle(
                  color: buttonColor,
                  fontSize: 35,
                  fontWeight: FontWeight.w900),
            ),
            const Text(
              "Register",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 25,
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 64,
                  backgroundColor: borderColor,
                ),
                Positioned(
                    right: 0,
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.add_a_photo)))
              ],
            ),
            Container(
              width: width - 50,
              child: Column(
                children: [
                  TextInputField(
                      controller: _nameController,
                      labelText: "UserName",
                      isObs: false,
                      icon: Icons.email),
                  const SizedBox(
                    height: 25,
                  ),
                  TextInputField(
                      controller: _emailController,
                      labelText: "Email",
                      isObs: true,
                      icon: Icons.lock),
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
                  Container(
                    width: width - 50,
                    height: 50,
                    child: CustomeButton(
                      onTap: () {},
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
