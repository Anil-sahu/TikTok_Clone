import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  String profile;
  String uid;
  UserModel(
      {required this.name,
      required this.email,
      required this.uid,
      required this.profile});

  Map<String, dynamic> toMap() =>
      {"name": name, "email": email, "profile": profile, "uid": uid};

  static UserModel fromSnapshot(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return UserModel(
        name: snap['name'],
        email: snap['email'],
        uid: snap['uid'],
        profile: snap['profile']);
  }
}
