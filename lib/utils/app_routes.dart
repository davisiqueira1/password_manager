import 'package:get/get.dart';
import 'package:password_manager/screens/auth.dart';
import 'package:password_manager/screens/onboard.dart';

appRoutes() => [
      GetPage(
        name: "/onboard",
        page: () => const OnboardScreen(),
      ),
      GetPage(
        name: "/auth",
        page: () => const AuthScreen(),
      ),
    ];
