import 'package:flutter/material.dart';
import 'package:onlygoal/src/data/model/percentage_model.dart';

import '../data/services/rest_services.dart';

class PercentageController extends ChangeNotifier {
  bool isLaoding = false;
  PercentageModel? percentageModel;

  getPercentage(String hometeamname, String awayteamname) async {
    isLaoding = true;
    percentageModel =
        await RestServices().getPercentage(hometeamname, awayteamname);
    isLaoding = false;
    notifyListeners();
  }
}
