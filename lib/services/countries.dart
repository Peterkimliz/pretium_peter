import 'dart:convert';

import 'package:pretium_peter/services/endpoints.dart';

import 'client.dart';

class Countries {

  static getCountries() async {
    var response = await DbBase.databaseRequest(countries, DbBase.postRequest);
    return json.decode(response);


  }

}