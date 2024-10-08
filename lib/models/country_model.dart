class CountryModel {
  int id;
  String name;
  String phoneCode;
  String currencyCode;

  CountryModel({
    required this.id,
    required this.name,
    required this.phoneCode,
    required this.currencyCode,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    id: json["id"],
    name: json["name"],
    phoneCode: json["phone_code"],
    currencyCode: json["currency_code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone_code": phoneCode,
    "currency_code": currencyCode,
  };
}