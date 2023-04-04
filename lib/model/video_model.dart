import 'package:cloud_firestore/cloud_firestore.dart';

class VideoModel {
  String username;
  String uid;
  String id;
  List likes;
  int commentCount;
  int shareCount;
  String videoName;
  String caption;
  String videoUrl;
  String thumbnail;
  String profilePhoto;
  VideoModel(
      {required this.username,
      required this.uid,
      required this.id,
      required this.likes,
      required this.commentCount,
      required this.shareCount,
      required this.videoName,
      required this.caption,
      required this.videoUrl,
      required this.thumbnail,
      required this.profilePhoto});

  Map<String, dynamic> toMap() => {
        "username": username,
        "uid": uid,
        "id": id,
        "likes": likes,
        "commentCount": commentCount,
        "shareCount": shareCount,
        "videoName": videoName,
        "caption": caption,
        "videoUrl": videoUrl,
        "thumbnail": thumbnail,
        "profilePhoto": profilePhoto
      };

  static VideoModel fromJson(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return VideoModel(
        username: snapshot['username'],
        uid: snapshot["uid"],
        id: snapshot['id'],
        likes: snapshot['likes'],
        commentCount: snapshot["commentCount"],
        shareCount: snapshot['shareCount'],
        videoName: snapshot['videoName'],
        caption: snapshot['caption'],
        videoUrl: snapshot['videoUrl'],
        thumbnail: snapshot['thumbnail'],
        profilePhoto: snapshot['profilePhoto']);
  }
}
