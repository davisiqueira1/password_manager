import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/controllers/session_controller.dart';

class UserController {
  static final _users = FirebaseFirestore.instance.collection("users");

  static Future<void> createUser(String name) async {
    try {
      final User? user = Get.find<SessionController>().user;
      if (user == null) throw Exception("Session user is not set");

      await _users.doc(user.uid).set({
        "uid": user.uid,
        "name": name,
        "email": user.email,
      });
    } catch (e) {
      print("Failed to create an user: $e");
      rethrow;
    }
  }

  static Future<DocumentReference> getUserRefById(String uid) async {
    return _users.doc(uid);
  }
}
