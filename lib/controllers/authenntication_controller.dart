import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_peter/controllers/countries_controller.dart';
import 'package:pretium_peter/controllers/home_controller.dart';
import 'package:pretium_peter/controllers/utilities_controller.dart';
import 'package:pretium_peter/models/user_model.dart';
import 'package:pretium_peter/screens/authentication/login_page.dart';
import 'package:pretium_peter/screens/home/home.dart';
import 'package:pretium_peter/services/user.dart';
import 'package:pretium_peter/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  RxBool showPassword = RxBool(true);
  RxBool loginInLoad = RxBool(false);
  RxBool loginInUser = RxBool(false);
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();

  Rxn<UserModel> currentProfile = Rxn(null);

  void loginIn({required BuildContext context}) async {
    try {
      if (formKey.currentState!.validate()) {
        passFocusNode.unfocus();
        emailFocusNode.unfocus();
        loginInLoad.value = true;
        Map<String, dynamic> body = {
          "email": emailTextEditingController.text,
          "password": passwordTextEditingController.text
        };
        var response = await User.loginUser(body);
        if (response["code"] == 400) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              response["message"],
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: mainColor,
          ));
        } else {
          UserModel userModel = UserModel.fromJson(response["data"]["profile"]);
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString("token", response["data"]["token"]);
          emailTextEditingController.clear();
          passwordTextEditingController.clear();
          checkUserAuthenticated();
        }

        loginInLoad.value = false;
      }
    } catch (e) {
      loginInLoad.value = false;
      print(e);
    }
  }

  getUserProfile() async {
    try {
      loginInUser.value = true;
      var response = await User.getUser();
      if (response["code"] == 200) {
        UserModel userModel = UserModel.fromJson(response["data"]);
        currentProfile.value = userModel;
        currentProfile.refresh();
      }
      print("Current profile is ${currentProfile.value!.toJson()}");
      loginInUser.value = false;
    } catch (e) {
      loginInUser.value = false;
    }
  }

  checkUserAuthenticated() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    if (token == null) {
      Get.off(() => LoginPage());
    } else {
      Get.off(() => Home());
      Get.find<CountriesController>().fetchCountrise();
      Get.find<UtilitiesController>().fetchUtilities();
      getUserProfile();
    }
  }

  logoutUser() async {
    try {
      Get.find<HomeController>().currentInde.value = 0;
      Get.find<CountriesController>().countries.clear();
      Get.find<CountriesController>().countries.refresh();
      Get.find<UtilitiesController>().utilities.clear();
      Get.find<UtilitiesController>().utilities.refresh();
      currentProfile.value = null;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.clear();
      Get.offAll(() => LoginPage());
    } catch (e) {
      print(e);
    }
  }
}
