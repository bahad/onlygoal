class LeaguesResultModel {
  List<Matches>? matches;

  LeaguesResultModel({this.matches});

  LeaguesResultModel.fromJson(Map<String, dynamic> json) {
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
      data['matches'] = matches?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Matches {
  int? awayTeamFirstHalfGoals;
  int? awayTeamFullTimeGoals;
  String? awayTeams;
  String? awayTeamsLogos;
  String? homeTeam;
  int? homeTeamFirstHalfGoals;
  int? homeTeamFullTimeGoals;
  String? homeTeamsLogos;
  int? week;

  Matches(
      {this.awayTeamFirstHalfGoals,
      this.awayTeamFullTimeGoals,
      this.awayTeams,
      this.awayTeamsLogos,
      this.homeTeam,
      this.homeTeamFirstHalfGoals,
      this.homeTeamFullTimeGoals,
      this.homeTeamsLogos,
      this.week});

  Matches.fromJson(Map<String, dynamic> json) {
    awayTeamFirstHalfGoals = json['AwayTeamFirstHalfGoals'];
    awayTeamFullTimeGoals = json['AwayTeamFullTimeGoals'];
    awayTeams = json['AwayTeams'];
    awayTeamsLogos = json['AwayTeamsLogos'];
    homeTeam = json['HomeTeam'];
    homeTeamFirstHalfGoals = json['HomeTeamFirstHalfGoals'];
    homeTeamFullTimeGoals = json['HomeTeamFullTimeGoals'];
    homeTeamsLogos = json['HomeTeamsLogos'];
    week = json['week'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AwayTeamFirstHalfGoals'] = awayTeamFirstHalfGoals;
    data['AwayTeamFullTimeGoals'] = awayTeamFullTimeGoals;
    data['AwayTeams'] = awayTeams;
    data['AwayTeamsLogos'] = awayTeamsLogos;
    data['HomeTeam'] = homeTeam;
    data['HomeTeamFirstHalfGoals'] = homeTeamFirstHalfGoals;
    data['HomeTeamFullTimeGoals'] = homeTeamFullTimeGoals;
    data['HomeTeamsLogos'] = homeTeamsLogos;
    data['week'] = week;
    return data;
  }
}
