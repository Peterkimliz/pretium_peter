import 'dart:convert';

import 'package:pretium_peter/services/client.dart';
import 'package:pretium_peter/services/endpoints.dart';

class User {

  static loginUser(Map<String,dynamic> body) async {
    var response = await DbBase.databaseRequest(loginUrl, DbBase.postRequest,body: body);
    return json.decode(response);


  }
  static getUser() async {
    var response = await DbBase.databaseRequest(profile, DbBase.postRequest);
    return json.decode(response);
  }
}
