import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SessionController extends GetxController {
  User? user;

  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.userChanges().listen((User? u) {
      if (u == null) {
        print("user signed out");
      } else {
        print("user is signed in");
        user = u;
        print("email: ${user!.email}");
        print("displayName: ${user!.displayName}");
      }
    });
  }
}
