import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/upload_video.dart';
import 'package:tiktok_clone/view/widget/CustomeButton.dart';
import 'package:tiktok_clone/view/widget/TextInputField.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreen extends StatefulWidget {
  final File vidoFile;

  final String videoPath;
  ConfirmScreen({super.key, required this.vidoFile, required this.videoPath});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController captionController = TextEditingController();
  UploadVideoController videoController = Get.put(UploadVideoController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.vidoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Obx(
      () => videoController.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: SingleChildScrollView(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: width,
                    height: height / 1.5,
                    child: VideoPlayer(controller),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          width: width - 20,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextInputField(
                              controller: nameController,
                              labelText: "Video title",
                              isObs: false,
                              icon: Icons.video_label),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: width - 20,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextInputField(
                              controller: captionController,
                              labelText: "Video Caption",
                              isObs: false,
                              icon: Icons.video_label),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomeButton(
                          onTap: () {
                            videoController.uploadVedio(
                                nameController.text.toString(),
                                captionController.text.toString(),
                                widget.videoPath);
                          },
                          text: "share",
                        )
                      ],
                    ),
                  )
                ],
              )),
            ),
    );
  }
}
