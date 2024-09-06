import 'package:get/get.dart';
import 'package:password_manager/core/bindings/bottombar_binding.dart';
import 'package:password_manager/screens/auth.dart';
import 'package:password_manager/screens/main_navigation.dart';
import 'package:password_manager/screens/onboard.dart';

appRoutes() => [
      GetPage(
        name: "/onboard",
        page: () => const OnboardScreen(),
      ),
      GetPage(
        name: "/auth",
        page: () => AuthScreen(),
      ),
      GetPage(
        name: "/main",
        page: () => const MainNavigationScreen(),
        binding: BottomBarBinding(),
      ),
    ];
