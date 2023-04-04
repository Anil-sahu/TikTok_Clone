import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/model/video_model.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = storage.ref().child("video").child(id);
    var uploadtask = await ref.putFile(await compressVideo(videoPath));
    var downloadUrl = await uploadtask.ref.getDownloadURL();
    return downloadUrl;
  }

  compressVideo(String videoPath) async {
    var video = await VideoCompress.compressVideo(videoPath,
        quality: VideoQuality.MediumQuality);
    return video!.file;
  }

  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  uploadImageToStorage(String id, String videoPath) async {
    Reference ref = storage.ref().child("thumbnail").child(id);
    var uploadtask = await ref.putFile(await _getThumbnail(videoPath));
    var downloadUrl = await uploadtask.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadVedio(String name, String caption, String videoUrl) async {
    try {
      String userId = auth.currentUser!.uid;
      DocumentSnapshot usersnap =
          await firestore.collection("user").doc(userId).get();
      var alldocs = await firestore.collection("video").get();
      int len = alldocs.docs.length;
      var videourl = await uploadVideoToStorage("video $len", videoUrl);
      var thumbnailUrl = await uploadImageToStorage("video $len", videoUrl);
      VideoModel videoModel = VideoModel(
          username: (usersnap.data()! as Map<String, dynamic>)['name'],
          uid: userId,
          id: "video $len",
          likes: [],
          commentCount: 0,
          shareCount: 0,
          videoName: name,
          caption: caption,
          videoUrl: videoUrl,
          thumbnail: thumbnailUrl,
          profilePhoto: (usersnap.data()! as Map<String, dynamic>)['profile']);
      await firestore
          .collection("post")
          .doc("video $len")
          .set(videoModel.toMap());
      Get.back();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
