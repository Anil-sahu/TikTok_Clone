import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/controller/Comment_controller.dart';

class CommentScreen extends StatefulWidget {
  final String id;
  const CommentScreen({super.key, required this.id});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController commController = TextEditingController();
  CommentController commentController = Get.put(CommentController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    commentController.updatePostId(widget.id);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                  child: Obx(
                () => ListView.builder(
                    itemCount: commentController.comments.length,
                    itemBuilder: (context, index) {
                      var comment = commentController.comments[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: NetworkImage(comment.profilePhoto),
                        ),
                        title: Row(children: [
                          Text(
                            comment.username,
                            style: TextStyle(
                                color: buttonColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            comment.comment,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ]),
                        subtitle: Row(
                          children: [
                            const Text(
                              "date",
                              style: TextStyle(
                                  color: borderColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${comment.likes.length} likes",
                              style: TextStyle(
                                  color: borderColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        trailing: InkWell(
                            onTap: () {
                              commentController.likeComment(comment.id);
                            },
                            child: Icon(
                              comment.likes.contains(authController.user.uid)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.redAccent,
                            )),
                      );
                    }),
              )),
              const Divider(),
              ListTile(
                title: TextFormField(
                  controller: commController,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  decoration: const InputDecoration(
                      labelText: "Comment",
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: borderColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red))),
                ),
                trailing: TextButton(
                  onPressed: () {
                    commentController.postComment(commController.text);
                  },
                  child: const Text(
                    "Send",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
