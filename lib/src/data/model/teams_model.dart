class TeamsModel {
  List<Teams>? teams;

  TeamsModel({this.teams});

  TeamsModel.fromJson(Map<String, dynamic> json) {
    if (json['teams'] != null) {
      teams = <Teams>[];
      json['teams'].forEach((v) {
        teams?.add(Teams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teams != null) {
      data['teams'] = teams?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teams {
  String? logo;
  String? name;

  Teams({this.logo, this.name});

  Teams.fromJson(Map<String, dynamic> json) {
    logo = json['logo'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['logo'] = logo;
    data['name'] = name;
    return data;
  }
}
