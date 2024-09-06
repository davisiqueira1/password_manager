import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/controllers/user_controller.dart';

class AuthController extends GetxController {
  RxBool formIsRegObx = RxBool(false);
  RxBool loading = false.obs;

  AuthController({
    bool formIsReg = false,
  }) {
    formIsRegObx.value = formIsReg;
  }

  toggleFormIsReg() => formIsRegObx.value = !formIsRegObx.value;
  toggleLoading() => loading.value = !loading.value;

  Future<void> registerWithEmail(
    String name,
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(name);
      // may have some delay. cant trust on session controller user stream being updated right after the call
      // ill pass the name as createUser parameter to make sure its accurate
      await Get.put(UserController()).createUser(name);
      await Get.offAllNamed("/main");
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
      await Get.offAllNamed("/main");
    } on FirebaseAuthException catch (e) {
      Map<String, String> firebaseAuthErrors = {
        "wrong-password": "Wrong e-mail or password",
        "invalid-email": "Invalid e-mail",
        "user-disabled":
            "The user corresponding to the given email has been disabled",
        "user-not-found": "Wrong e-mail or password",
        "invalid-credential": "Wrong e-mail or password",
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
