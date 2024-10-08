import 'dart:convert';

import 'client.dart';
import 'endpoints.dart';

class Utilities{
  static getUtilities() async {
    var response = await DbBase.databaseRequest(utilities, DbBase.postRequest);
    return json.decode(response);
  }
}