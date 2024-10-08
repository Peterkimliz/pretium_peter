import 'country_model.dart';
class UserModel {
  int id;
  String firstName;
  String lastName;
  String email;
  String gender;
  String mobile;
  DateTime dob;
  String idNo;
  String avatar;
  CountryModel country;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.mobile,
    required this.dob,
    required this.idNo,
    required this.avatar,
    required this.country,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    gender: json["gender"],
    mobile: json["mobile"],
    dob: DateTime.parse(json["dob"]),
    idNo: json["id_no"],
    avatar: json["avatar"]??"",
    country: CountryModel.fromJson(json["country"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "gender": gender,
    "mobile": mobile,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "id_no": idNo,
    "avatar": avatar,
    "country": country.toJson(),
  };
}


