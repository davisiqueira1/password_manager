import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/models/password_model.dart';

class PasswordController extends GetxController {
  static final _passwords = FirebaseFirestore.instance.collection("passwords");
  static final _accounts = FirebaseFirestore.instance.collection("accounts");

  static Future<Password> getPasswordByAccountId(String uid) async {
    try {
      final accountRef = _accounts.doc(uid);
      final passwordDocs = (await _passwords
              .where(
                "accountRef",
                isEqualTo: accountRef,
              )
              .get())
          .docs;

      final password = Password.fromSnapshot(passwordDocs.first);
      return password;
    } catch (e) {
      print("Error (probably wrong accountId)");
      rethrow;
    }
  }

  static Future<String> createPassword(Password password) async {
    try {
      final pwdRef = _passwords.doc();
      await pwdRef.set(password.toJSON());
      return pwdRef.id;
    } catch (e) {
      print("Error while creating password");
      rethrow;
    }
  }
}
