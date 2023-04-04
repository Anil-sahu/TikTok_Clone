import 'package:get/get.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/model/video_model.dart';

class VideoController extends GetxController {
  final Rx<List<VideoModel>> _videoList = Rx<List<VideoModel>>([]);
  List<VideoModel> get videoList => _videoList.value;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _videoList.bindStream(firestore.collection("post").snapshots().map((event) {
      List<VideoModel> retVideo = [];
      for (var element in event.docs) {
        retVideo.add(VideoModel.fromJson(element));
      }
      return retVideo;
    }));
  }
}
