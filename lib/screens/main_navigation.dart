import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/controllers/bottombar_controller.dart';

class MainNavigationScreen extends GetView<BottomBarController> {
  const MainNavigationScreen({super.key});

  final List<Widget> elements = const [
    Text("1"),
    Text("2"),
    Text("3"),
    Text("4"),
  ];

  final Map<int, String> pageName = const {
    0: "Passwords",
    1: "Security",
    2: "Search",
    3: "Settings",
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: Center(
            child: elements.elementAt(controller.currentIndex.value),
          ),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              height: 50,
              margin: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset("assets/images/profile.svg"),
                  Text(
                    pageName[controller.currentIndex.value]!,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SvgPicture.asset("assets/images/add.svg"),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            onTap: controller.increment,
            enableFeedback: false,
            selectedLabelStyle: const TextStyle(color: Colors.black),
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            useLegacyColorScheme: false,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/home-outlined.svg"),
                activeIcon: SvgPicture.asset("assets/images/home-filled.svg"),
                label: "HOME",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/analysis-outlined.svg"),
                activeIcon:
                    SvgPicture.asset("assets/images/analysis-filled.svg"),
                label: "ANALYSIS",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/search.svg"),
                label: "SEARCH",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/settings-outlined.svg"),
                activeIcon:
                    SvgPicture.asset("assets/images/settings-filled.svg"),
                label: "SETTINGS",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
