import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_peter/controllers/home_controller.dart';
import 'package:pretium_peter/utils/app_colors.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => homeController.screens[homeController.currentInde.value]),
      bottomNavigationBar: Obx(()=>BottomNavigationBar(
          onTap: (value) => homeController.currentInde.value = value,
          currentIndex: homeController.currentInde.value,
          selectedItemColor: mainColor,

          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.wifi), label: "Utilities"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ])),
    );
  }
}
