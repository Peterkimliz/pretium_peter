import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_peter/controllers/countries_controller.dart';
import 'package:pretium_peter/models/country_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final CountriesController countriesController =
      Get.find<CountriesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text("Countries"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          countriesController.fetchCountrise();
        },
        child: SafeArea(
          child: Obx(() {
            return countriesController.loadingCountries.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : countriesController.countries.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: countriesController.countries.length,
                        itemBuilder: (context, index) {
                          CountryModel countryModel =
                              countriesController.countries.elementAt(index);
                          return ListTile(
                            title: Text(countryModel.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Currency: ${countryModel.currencyCode}"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Phone Code: ${countryModel.phoneCode}"),
                                Divider(),
                              ],
                            ),
                          );
                        })
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              countriesController.fetchCountrise();
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
      ),
    );
  }
}
