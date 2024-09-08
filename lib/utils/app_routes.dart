import 'package:get/get.dart';
import 'package:password_manager/core/bindings/main_navigation_binding.dart';
import 'package:password_manager/core/bindings/new_record_binding.dart';
import 'package:password_manager/screens/auth.dart';
import 'package:password_manager/screens/main_navigation.dart';
import 'package:password_manager/screens/new_record.dart';
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
        binding: MainNavigationBinding(),
      ),
      GetPage(
        name: "/newRecord",
        page: () => const NewRecordScreen(),
        binding: NewRecordBinding(),
      ),
    ];
