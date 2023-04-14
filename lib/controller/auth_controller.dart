import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/model/user_model.dart';
import 'package:tiktok_clone/view/screen/Home/HomePage.dart';
import 'package:tiktok_clone/view/screen/auth_screen/login_screen.dart';

import '../constant.dart';

class AuthController extends GetxController {
  late Rx<File?> profile;
  static AuthController instance = Get.find();
  late Rx<User?> _user;

  File? get profileImage => profile.value;
  User get user => auth.currentUser!;
  @override
  void onInit() {
    _user = Rx<User?>(auth.currentUser);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    _user.bindStream(auth.authStateChanges());
    ever(_user, setInitial);
  }

  setInitial(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => const HomePage());
    }
  }

  pickImage() async {
    var pickImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      profile = Rx<File?>(File(pickImage.path));
    }
  }

  _uploadImage(File img) async {
    var ref = storage.ref().child("profile").child(auth.currentUser!.uid);
    UploadTask task = ref.putFile(img);
    TaskSnapshot snap = await task;
    String downloadurl = await snap.ref.getDownloadURL();
    return downloadurl;
  }

  login(
    String email,
    String password,
  ) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential credential = await auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {}
    } catch (e) {
      Get.snackbar("Login error", e.toString());
    }
  }

  register(String name, String email, String password, File? img) async {
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          name.isNotEmpty &&
          img != null) {
        UserCredential credential = await auth.createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim());
        String downloadUrl = await _uploadImage(img);
        UserModel _user = UserModel(
            name: name,
            email: email,
            uid: credential.user!.uid,
            profile: downloadUrl);
        firestore
            .collection("user")
            .doc(credential.user!.uid)
            .set(_user.toMap());
      } else {
        Get.snackbar("Registration error", "Please fill empty field");
      }
    } catch (e) {
      Get.snackbar("Login error", e.toString());
    }
  }

  void signOut() async {
    await auth.signOut();
  }
}
