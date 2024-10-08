import 'package:get/get.dart';
import 'package:pretium_peter/models/country_model.dart';
import 'package:pretium_peter/services/countries.dart';

class CountriesController extends GetxController {
  RxBool loadingCountries = RxBool(false);

  RxList<CountryModel> countries = RxList([]);

  fetchCountrise() async {
    try {
      countries.clear();
      loadingCountries.value = true;
      var response = await Countries.getCountries();
      if (response["code"] == 200) {
        List countList = response["data"];
        List<CountryModel> fetchedCountries =
            countList.map((e) => CountryModel.fromJson(e)).toList();
        countries.addAll(fetchedCountries);
      }
      print("Countries are ${countries.map((e) => e.toJson()).toList()}");

      loadingCountries.value = false;
    } catch (e) {
      loadingCountries.value = false;
      print(e);
    }
  }

}
