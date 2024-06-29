import 'package:get/get.dart';
import 'package:password_manager/screens/auth.dart';
import 'package:password_manager/screens/onboard.dart';
import 'package:password_manager/screens/code_verification.dart';

appRoutes() => [
      GetPage(
        name: "/onboard",
        page: () => const OnboardScreen(),
      ),
      GetPage(
        name: "/auth",
        page: () => const AuthScreen(),
      ),
      GetPage(
        name: "/codeVerification",
        page: () => const CodeVerificationScreen(),
      ),
    ];
