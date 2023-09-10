class LeaguesModel {
  List<Leagues>? leagues;

  LeaguesModel({this.leagues});

  LeaguesModel.fromJson(Map<String, dynamic> json) {
    if (json['leagues'] != null) {
      leagues = <Leagues>[];
      json['leagues'].forEach((v) {
        leagues?.add(Leagues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (leagues != null) {
      data['leagues'] = leagues?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Leagues {
  String? logo;
  String? name;

  Leagues({this.logo, this.name});

  Leagues.fromJson(Map<String, dynamic> json) {
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
