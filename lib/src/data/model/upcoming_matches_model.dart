class UpcomingMatchesModel {
  List<Matches>? matches;

  UpcomingMatchesModel({this.matches});

  UpcomingMatchesModel.fromJson(Map<String, dynamic> json) {
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches?.add(Matches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Matches {
  String? awayTeams;
  String? awayTeamsLogos;
  String? homeTeam;
  String? homeTeamsLogos;

  Matches(
      {this.awayTeams,
      this.awayTeamsLogos,
      this.homeTeam,
      this.homeTeamsLogos});

  Matches.fromJson(Map<String, dynamic> json) {
    awayTeams = json['AwayTeams'];
    awayTeamsLogos = json['AwayTeamsLogos'];
    homeTeam = json['HomeTeam'];
    homeTeamsLogos = json['HomeTeamsLogos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AwayTeams'] = awayTeams;
    data['AwayTeamsLogos'] = awayTeamsLogos;
    data['HomeTeam'] = homeTeam;
    data['HomeTeamsLogos'] = homeTeamsLogos;
    return data;
  }
}
