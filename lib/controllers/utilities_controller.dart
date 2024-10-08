import 'package:get/get.dart';
import 'package:pretium_peter/models/utlityModel.dart';
import 'package:pretium_peter/services/utilities.dart';

class UtilitiesController extends GetxController {
  RxBool loadingUtilities = RxBool(false);

  RxList<UtilityModel> utilities = RxList([]);

  fetchUtilities() async {
    try {
      utilities.clear();
      loadingUtilities.value = true;
      var response = await Utilities.getUtilities();
      if (response["code"] == 200) {
        List util = response["data"];
        List<UtilityModel> fetchedCountries =
        util.map((e) => UtilityModel.fromJson(e)).toList();
        utilities.addAll(fetchedCountries);
      }
      print("utility are ${utilities.map((e) => e.toJson()).toList()}");

      loadingUtilities.value = false;
    } catch (e) {
      loadingUtilities.value = false;
      print(e);
    }
  }

}
