import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool formIsRegObx = RxBool(false);

  AuthController({
    bool formIsReg = false,
  }) {
    formIsRegObx.value = formIsReg;
  }

  toggleFormIsReg() => formIsRegObx.value = !formIsRegObx.value;

  Future<void> registerWithEmail(String email, String password) async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Map<String, String> firebaseAuthErrors = {
        "email-already-in-use":
            "An account with the given email address already exists.",
        "invalid-email": "Invalid email address.",
        "operation-not-allowed": "Invalid login operation. Contact support.",
        "weak-password": "Password not strong enough.",
      };
      Get.snackbar(
        "Authentication error",
        firebaseAuthErrors[e.code] ?? "Unknown error",
      );
      rethrow;
    } catch (e) {
      Get.snackbar(
        "Authentication error",
        "Unknown error",
      );
      rethrow;
    }
  }

  Future<void> loginWithEmail(String email, String password) async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Map<String, String> firebaseAuthErrors = {
        "wrong-password": "Wrong e-mail or password",
        "invalid-email": "Invalid e-mail",
        "user-disabled":
            "The user corresponding to the given email has been disabled",
        "user-not-found": "Wrong e-mail or password",
      };
      Get.snackbar(
        "Authentication error",
        firebaseAuthErrors[e.code] ?? "Unknown error",
      );
      rethrow;
    } catch (e) {
      Get.snackbar(
        "Authentication error",
        "Unknown error",
      );
      rethrow;
    }
  }
}
