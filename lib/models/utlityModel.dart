

class UtilityModel {
  int id;
  String code;
  String name;
  String category;
  String lowLimit;
  String highLimit;
  String icon;
  Utility utility;

  UtilityModel({
    required this.id,
    required this.code,
    required this.name,
    required this.category,
    required this.lowLimit,
    required this.highLimit,
    required this.icon,
    required this.utility,
  });

  factory UtilityModel.fromJson(Map<String, dynamic> json) => UtilityModel(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    category: json["category"],
    lowLimit: json["low_limit"],
    highLimit: json["high_limit"],
    icon: json["icon"],
    utility: Utility.fromJson(json["utility"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "category": category,
    "low_limit": lowLimit,
    "high_limit": highLimit,
    "icon": icon,
    "utility": utility.toJson(),
  };
}

class Utility {
  int id;
  String name;
  DateTime createdAt;

  Utility({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory Utility.fromJson(Map<String, dynamic> json) => Utility(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt.toIso8601String(),
  };
}
