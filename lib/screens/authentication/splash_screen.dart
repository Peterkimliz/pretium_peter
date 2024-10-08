import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_peter/controllers/authenntication_controller.dart';
import 'package:pretium_peter/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 5000), () async {
      await Get.find<AuthenticationController>().checkUserAuthenticated();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/pretiumlogo.png",
              height: 200,
              width: 200,
              fit: BoxFit.cover,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "Pretium",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          )
        ],
      )),
    );
  }
}
