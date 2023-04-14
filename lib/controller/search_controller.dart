import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/model/user_model.dart';

class SearchController extends GetxController {
  final Rx<List<UserModel>> _searchUsers = Rx<List<UserModel>>([]);
  List<UserModel> get searchUsers => _searchUsers.value;

  searchUser(typeUser) async {
    _searchUsers.bindStream(firestore
        .collection("user")
        .where("name", isGreaterThanOrEqualTo: typeUser)
        .snapshots()
        .map((event) {
      List<UserModel> retVal = [];
      for (var data in event.docs) {
        retVal.add(UserModel.fromSnapshot(data));
      }
      return retVal;
    }));
  }
}
