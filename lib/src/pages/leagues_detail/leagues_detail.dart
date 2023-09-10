import 'package:flutter/material.dart';
import 'package:onlygoal/src/controllers/leagues_detail.dart';
import 'package:onlygoal/src/pages/leagues_detail/widgets/build_upcoming_matches.dart';
import 'package:provider/provider.dart';

import 'widgets/build_results.dart';

class LeaguesDetail extends StatefulWidget {
  final String leagueTitle;
  const LeaguesDetail({super.key, required this.leagueTitle});

  @override
  State<LeaguesDetail> createState() => _LeaguesDetailState();
}

class _LeaguesDetailState extends State<LeaguesDetail> {
  @override
  void initState() {
    LeaguesDetailController leaguesDetailController =
        Provider.of<LeaguesDetailController>(context, listen: false);
    leaguesDetailController.getLeagueResult(widget.leagueTitle);
    leaguesDetailController.getUpcomingMatches(widget.leagueTitle);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //LeaguesDetailController leaguesDetailController =Provider.of<LeaguesDetailController>(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.leagueTitle),
          centerTitle: true,
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Sonuçlar',
              ),
              Tab(
                text: 'Takımlar',
              ),
              Tab(
                text: 'Gelecek H. Maçları',
              ),
              Tab(
                text: 'İstatistikler',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            BuildResults(),
            BuildResults(),
            BuildUpcomingMatches(),
            BuildResults()
          ],
        ),
      ),
    );
  }
}
