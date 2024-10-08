import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_peter/controllers/authenntication_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final AuthenticationController authController = Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          return authController.loginInUser.value
              ? const Center(
            child: CircularProgressIndicator(),
          )

              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  authController.getUserProfile();
                },
                child: const Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.refresh,
                        color: Colors.grey,
                        size: 80,
                      ),
                      Text(
                        "Refresh",
                        style: TextStyle(
                            color: Colors.grey, fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
