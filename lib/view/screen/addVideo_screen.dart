import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/view/screen/Confirm_screen.dart';

class AddVideoScreen extends StatefulWidget {
  const AddVideoScreen({super.key});

  @override
  State<AddVideoScreen> createState() => _AddVideoScreenState();
}

class _AddVideoScreenState extends State<AddVideoScreen> {
  pickViedio(videoSrc, context) async {
    var video = await ImagePicker().pickVideo(source: videoSrc);
    if (video != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return ConfirmScreen(
          vidoFile: File(video.path),
          videoPath: video.path,
        );
      }));
    }
  }

  showOptionDailog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              SimpleDialogOption(
                onPressed: () {
                  pickViedio(ImageSource.gallery, context);
                },
                child: Row(children: const [
                  Icon(Icons.image),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Gallery",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ]),
              ),
              SimpleDialogOption(
                onPressed: () {
                  pickViedio(ImageSource.camera, context);
                },
                child: Row(children: const [
                  Icon(Icons.camera),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Camera",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ]),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Get.back();
                },
                child: Row(children: const [
                  Icon(Icons.close),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ]),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            showOptionDailog(context);
          },
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(color: buttonColor),
            child: const Center(
              child: Text(
                "Add Video",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
