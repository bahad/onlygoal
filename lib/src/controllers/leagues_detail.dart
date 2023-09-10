import 'package:flutter/material.dart';
import 'package:onlygoal/src/data/model/teams_model.dart';
import 'package:onlygoal/src/data/model/upcoming_matches_model.dart';
import 'package:onlygoal/src/data/services/rest_services.dart';

class LeaguesDetailController extends ChangeNotifier {
  bool isLoadingLeaguesResult = false;
  bool isLoadingTeams = false;
  bool isLoadingUpcomingMatches = false;
  List? leaguesResult;
  UpcomingMatchesModel? upcomingMatchesModel;
  TeamsModel? teamsModel;

  getLeagueResult(String leagueTitle) async {
    isLoadingLeaguesResult = true;
    leaguesResult = await RestServices().getLeaguesResult(leagueTitle);
    isLoadingLeaguesResult = false;
    notifyListeners();
  }

  getTeams(String leagueTitle) async {
    isLoadingTeams = true;
    teamsModel = await RestServices().getTeams(leagueTitle);
    isLoadingTeams = false;
    notifyListeners();
  }

  getUpcomingMatches(String leagueTitle) async {
    isLoadingUpcomingMatches = true;
    upcomingMatchesModel = await RestServices().getUpcomingMatches(leagueTitle);
    isLoadingUpcomingMatches = false;
    notifyListeners();
  }
}
