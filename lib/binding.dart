import 'package:get/get.dart';
import 'package:pretium_peter/controllers/authenntication_controller.dart';
import 'package:pretium_peter/controllers/countries_controller.dart';
import 'package:pretium_peter/controllers/home_controller.dart';
import 'package:pretium_peter/controllers/utilities_controller.dart';


class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthenticationController>(AuthenticationController(),
        permanent: true);
    Get.put<CountriesController>(CountriesController(), permanent: true);
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.put<UtilitiesController>(UtilitiesController(), permanent: true);
  }
}
