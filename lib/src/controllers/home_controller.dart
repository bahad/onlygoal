import 'package:flutter/material.dart';

import 'package:onlygoal/src/data/model/leagues_model.dart';
import 'package:onlygoal/src/data/services/rest_services.dart';

class HomeController extends ChangeNotifier {
  bool isLoading = false;
  LeaguesModel? leaguesModel;

  Future getLeagues() async {
    isLoading = true;
    leaguesModel = await RestServices().getLeagues();
    isLoading = false;
    notifyListeners();
  }
}
