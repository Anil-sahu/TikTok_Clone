import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constant.dart';

class ProfileController extends GetxController {
  final Rx<Map<String, dynamic>> _user = Rx<Map<String, dynamic>>({});
  Map<String, dynamic> get user => _user.value;
  Rx<String> _uid = "".obs;
  updateUserID(String uid) {
    _uid.value = uid;
    getUserData();
  }

  getUserData() async {
    List<String> thumbnails = [];
    bool isFollowing = false;
    var myVideo = await firestore
        .collection("post")
        .where('uid', isEqualTo: _uid.value)
        .get();

    for (int i = 0; i < myVideo.docs.length; i++) {
      thumbnails.add((myVideo.docs[i].data() as dynamic)['thumbnail']);
    }

    DocumentSnapshot docSnap =
        await firestore.collection("user").doc(_uid.value).get();
    final data = docSnap.data()! as dynamic;
    String name = data['name'];
    String profilePhoto = data['profile'];
    int like = 0;
    int followers = 0;
    int following = 0;
    for (var item in myVideo.docs) {
      like = (item.data()['likes'] as List).length;
    }
    var followerdoc = await firestore
        .collection("user")
        .doc(_uid.value)
        .collection("follower")
        .get();
    var followingdoc = await firestore
        .collection("user")
        .doc(_uid.value)
        .collection("following")
        .get();
    followers = followerdoc.docs.length;
    following = followingdoc.docs.length;

    firestore
        .collection("user")
        .doc(_uid.value)
        .collection("follower")
        .doc(authController.user.uid)
        .get()
        .then((value) {
      if (value.exists) {
        isFollowing = true;
      } else {
        isFollowing = false;
      }
    });
    _user.value = {
      "follower": followers.toString(),
      "following": following.toString(),
      "isFollowing": isFollowing,
      "like": like.toString(),
      "profile": profilePhoto,
      "name": name,
      "thumbnail": thumbnails
    };
  }

  followUser() async {
    var doc = await firestore
        .collection("user")
        .doc(_uid.value)
        .collection("follower")
        .doc(authController.user.uid)
        .get();
    if (doc.exists) {
      await firestore
          .collection("user")
          .doc(_uid.value)
          .collection("follower")
          .doc(authController.user.uid)
          .set({});
      await firestore
          .collection("user")
          .doc(authController.user.uid)
          .collection("follower")
          .doc(_uid.value)
          .set({});
      _user.value
          .update("follower", (value) => (int.parse(value) + 1).toString());
    } else {
      await firestore
          .collection("user")
          .doc(_uid.value)
          .collection("follower")
          .doc(authController.user.uid)
          .delete();
      await firestore
          .collection("user")
          .doc(authController.user.uid)
          .collection("follower")
          .doc(_uid.value)
          .delete();
      _user.value
          .update("follower", (value) => (int.parse(value) - 1).toString());
      _user.value.update("isFollowing", (value) => !value);
      update();
    }
  }
}
