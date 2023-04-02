import 'package:flutter/material.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/view/screen/auth_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok clone',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bacgroundcolor),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
