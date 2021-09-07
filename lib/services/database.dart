import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserInfoToDB(
      String userId, Map<String, dynamic> userInfoMap) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getServiceProvider(
      String username, String many) async {
    return FirebaseFirestore.instance
        .collection("blogs")
        .where("Post", isEqualTo: username)
        .where("Sub", isEqualTo: many)
        .snapshots();
  }

  Future<QuerySnapshot> getUserInfo(String username) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .get();
  }

  Future<Stream<QuerySnapshot>> getProvider(String username) async {
    return FirebaseFirestore.instance
        .collection("blogs")
        .where("name", isEqualTo: username)
        .snapshots();
  }
}
