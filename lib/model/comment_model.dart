import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  String username;
  String comment;
  final datePublish;
  List likes;
  String profilePhoto;
  String uid;
  String id;
  CommentModel(
      {required this.username,
      required this.comment,
      required this.datePublish,
      required this.likes,
      required this.profilePhoto,
      required this.uid,
      required this.id});
  Map<String, dynamic> toMap() => {
        "username": username,
        "comment": comment,
        "datePublish": datePublish,
        "likes": likes,
        "profile": profilePhoto,
        "uid": uid,
        "id": id
      };
  static CommentModel fromJson(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return CommentModel(
        username: snapshot['username'],
        comment: snapshot['comment'],
        datePublish: snapshot['datePublish'],
        likes: snapshot['likes'],
        profilePhoto: snapshot['profile'],
        uid: snapshot['uid'],
        id: snapshot['id']);
  }
}
