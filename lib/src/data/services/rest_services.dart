import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:onlygoal/src/data/model/leagues_model.dart';
import 'package:onlygoal/src/data/model/percentage_model.dart';
import '../model/upcoming_matches_model.dart';

abstract class IRestServices {
  IRestServices();
  Future getLeagues();
  Future getLeaguesResult(String leagueName);
  Future getUpcomingMatches(String leagueName);
  Future getPercentage(String homeTeam, String awayTeam);
}

class RestServices implements IRestServices {
  static const apiurl = "predict-ox6ywexaua-oe.a.run.app";
  @override
  Future getLeagues() async {
    LeaguesModel leaguesModel;
    try {
      final response = await get(Uri.https(apiurl, "leagues"));
      final decodedJson = json.decode(response.body);
      leaguesModel = LeaguesModel.fromJson(decodedJson);
      debugPrint("Services : ${leaguesModel.leagues?.length}");
      return leaguesModel;
    } catch (e) {
      debugPrint(e.toString());
      return 0;
    }
  }

  @override
  Future getLeaguesResult(String leagueName) async {
    final queryParameters = {
      'leaguename': leagueName,
    };
    try {
      final response = await get(
        Uri.https(apiurl, "leagueresults", queryParameters),
      );
      Map<String, dynamic> body = jsonDecode(response.body);
      List result = body['matches'];
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return 0;
    }
  }

  @override
  Future getUpcomingMatches(String leagueName) async {
    UpcomingMatchesModel upcomingMatchesModel;
    final queryParameters = {
      'leaguename': leagueName,
    };
    try {
      final res = await get(
        Uri.https(apiurl, "leaguefixtures", queryParameters),
      );
      final decodedJson = json.decode(res.body);
      upcomingMatchesModel = UpcomingMatchesModel.fromJson(decodedJson);
      debugPrint(upcomingMatchesModel.toString());
      return upcomingMatchesModel;
    } catch (e) {
      debugPrint(e.toString());
      return 0;
    }
  }

  @override
  Future getPercentage(String hometeamname, String awayteamname) async {
    PercentageModel percentageModel;
    final queryParameters = {
      'hometeamname': hometeamname,
      'awayteamname': awayteamname,
    };
    try {
      final res = await get(
        Uri.https(apiurl, "oransbymatch", queryParameters),
      );
      final decodedJson = json.decode(res.body);
      percentageModel = PercentageModel.fromJson(decodedJson);
      debugPrint(percentageModel.toString());
      return percentageModel;
    } catch (e) {
      debugPrint(e.toString());
      return 0;
    }
  }
}
