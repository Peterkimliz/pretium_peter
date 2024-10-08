import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pretium_peter/screens/home/home_page.dart';
import 'package:pretium_peter/screens/home/profile_page.dart';
import 'package:pretium_peter/screens/home/utility_page.dart';

class HomeController extends GetxController{
  List<Widget> screens=[
    HomePage(),
    UtilityPage(),
    ProfilePage()
  ];

  RxInt currentInde=RxInt(0);

}