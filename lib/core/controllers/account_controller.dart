import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/controllers/password_controller.dart';
import 'package:password_manager/core/controllers/session_controller.dart';
import 'package:password_manager/core/models/account_model.dart';
import 'package:password_manager/core/models/password_model.dart';

class AccountController extends GetxController {
  final _accCollection = FirebaseFirestore.instance.collection("accounts");
  final _passwords = FirebaseFirestore.instance.collection("passwords");
  final _users = FirebaseFirestore.instance.collection("users");

  List<Account> _accounts = [];

  List<Account> get accounts => List<Account>.from(_accounts);

  Future<void> initialize() async {
    final userId = Get.find<SessionController>().user!.uid;
    print("initializing accounts with userId: $userId");
    _accounts = await getAccountsByUserId(userId);
    print("accounts length: ${_accounts.length}");
  }

  Future<List<Account>> getAccountsByUserId(String uid) async {
    try {
      final userRef = _users.doc(uid);
      final accountDocs = (await _accCollection
              .where(
                "userRef",
                isEqualTo: userRef,
              )
              .get())
          .docs;
      final List<Account> accounts =
          accountDocs.map((e) => Account.fromSnapshot(e)).toList();
      return accounts;
    } catch (e) {
      print("Error (probably wrong userId)");
      rethrow;
    }
  }

  Future<String> createAccount(Account account, Password password) async {
    try {
      final accRef = _accCollection.doc();
      final pwdRef = _passwords.doc();
      account.uid = accRef.id;
      password.accountRef = accRef;
      password.uid = pwdRef.id;
      account.passwordRef = pwdRef;
      await accRef.set(account.toJSON());
      await PasswordController.createPassword(password);
      _accounts.add(account);
      return accRef.id;
    } catch (e) {
      print("Error while creating account");
      rethrow;
    }
  }
}
