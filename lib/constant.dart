import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/view/screen/Home/HomePage.dart';
import 'package:tiktok_clone/view/screen/addVideo_screen.dart';
import 'package:tiktok_clone/view/screen/profile_screen.dart';
import 'package:tiktok_clone/view/screen/search_screen.dart';
import 'package:tiktok_clone/view/screen/video_Screen.dart';

const bacgroundcolor = Colors.black;

var buttonColor = Colors.red[400];

const borderColor = Colors.grey;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;

var authController = AuthController();

var pages = [
  const VideoScreen(),
  const SearchScreen(),
  const AddVideoScreen(),
  const Text("Message"),
  ProfileScreen(uid: authController.user.uid)
];
