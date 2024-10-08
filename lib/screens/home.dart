import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/controllers/account_controller.dart';
import 'package:password_manager/core/controllers/home_controller.dart';
import 'package:password_manager/core/models/account_model.dart';
import 'package:password_manager/widgets/item_tile.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountController = Get.find<AccountController>();
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: accountController.initialize(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }

            return SingleChildScrollView(
              child: Obx(
                () => Column(
                  children: accountController.accounts
                      .map((Account acc) => ItemTile(
                            platformName: acc.name,
                            email: acc.login,
                          ))
                      .toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
