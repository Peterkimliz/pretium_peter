import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_peter/binding.dart';
import 'package:pretium_peter/screens/authentication/login_page.dart';
import 'package:pretium_peter/screens/authentication/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pretium',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: AppBindings(),
      home: SplashScreen(),
    );
  }
}
