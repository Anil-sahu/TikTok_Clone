import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/search_controller.dart';
import 'package:tiktok_clone/model/user_model.dart';
import 'package:tiktok_clone/view/screen/profile_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: TextFormField(
            decoration: const InputDecoration(
                filled: false,
                hintText: "search",
                hintStyle: TextStyle(color: Colors.white, fontSize: 18)),
            onFieldSubmitted: (value) {
              searchController.searchUser(value);
            },
          ),
        ),
        body: searchController.searchUsers.isEmpty
            ? const Center(
                child: Text(
                  "Search for user",
                  style: TextStyle(),
                ),
              )
            : ListView.builder(
                itemCount: searchController.searchUsers.length,
                itemBuilder: (context, index) {
                  UserModel user = searchController.searchUsers[index];
                  return InkWell(
                    onTap: () {
                      Get.to(() => ProfileScreen(uid: user.uid));
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(user.profile),
                      ),
                      title: Text(
                        user.name,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
