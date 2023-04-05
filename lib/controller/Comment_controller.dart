import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/model/comment_model.dart';

class CommentController extends GetxController {
  final Rx<List<CommentModel>> _comment = Rx<List<CommentModel>>([]);
  List<CommentModel> get comments => _comment.value;
  String _postId = "";
  updatePostId(String id) {
    _postId = id;
    getComment();
  }

  getComment() async {
    _comment.bindStream(firestore
        .collection("post")
        .doc(_postId)
        .collection("comments")
        .snapshots()
        .map((event) {
      List<CommentModel> retValue = [];
      for (var element in event.docs) {
        retValue.add(CommentModel.fromJson(element));
      }
      return retValue;
    }));
  }

  postComment(String commentText) async {
    if (commentText.isNotEmpty) {
      try {
        var userDoc = await firestore
            .collection("user")
            .doc(authController.user.uid)
            .get();
        var alldocs = await firestore
            .collection("post")
            .doc(_postId)
            .collection("comments")
            .get();
        int len = alldocs.docs.length;
        CommentModel comment = CommentModel(
            username: (userDoc.data()! as dynamic)['name'],
            comment: commentText,
            datePublish: DateTime.now(),
            likes: [],
            profilePhoto: (userDoc.data()! as dynamic)['profile'],
            uid: authController.user.uid,
            id: "comment $len");
        await firestore
            .collection('post')
            .doc(_postId)
            .collection("comments")
            .doc("comment $len")
            .set(comment.toMap());
        DocumentSnapshot snap =
            await firestore.collection("post").doc(_postId).get();
        await firestore.collection("post").doc(_postId).update(
            {"commentCount": (snap.data()! as dynamic)['commentCount'] + 1});
      } catch (e) {}
    }
  }
}
