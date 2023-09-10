import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlygoal/src/pages/percentages/percentage_view.dart';
import 'package:provider/provider.dart';

import '../../../controllers/leagues_detail.dart';

class BuildUpcomingMatches extends StatefulWidget {
  const BuildUpcomingMatches({super.key});

  @override
  State<BuildUpcomingMatches> createState() => _BuildUpcomingMatchesState();
}

class _BuildUpcomingMatchesState extends State<BuildUpcomingMatches> {
  @override
  Widget build(BuildContext context) {
    LeaguesDetailController leaguesDetailController =
        Provider.of<LeaguesDetailController>(context);
    if (leaguesDetailController.isLoadingUpcomingMatches) {
      return const SizedBox();
    } else if (leaguesDetailController.upcomingMatchesModel == null) {
      return const SizedBox();
    } else if (leaguesDetailController.upcomingMatchesModel?.matches == null) {
      return const SizedBox();
    } else if (leaguesDetailController.upcomingMatchesModel?.matches?.isEmpty ==
        true) {
      return const SizedBox();
    } else {
      return ListView.separated(
        shrinkWrap: true,
        itemCount:
            leaguesDetailController.upcomingMatchesModel!.matches!.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PercentagesPage(
                            hometeamname: leaguesDetailController
                                    .upcomingMatchesModel
                                    ?.matches?[index]
                                    .homeTeam ??
                                "",
                            awayteamname: leaguesDetailController
                                    .upcomingMatchesModel
                                    ?.matches?[index]
                                    .awayTeams ??
                                "",
                          )));
            },
            child: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //! HOME TEAM
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: leaguesDetailController.upcomingMatchesModel
                                ?.matches?[index].homeTeamsLogos ??
                            "",
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(
                            "${leaguesDetailController.upcomingMatchesModel?.matches?[index].homeTeam} - ${leaguesDetailController.upcomingMatchesModel?.matches?[index].awayTeams}",
                            style: TextStyle(
                                fontFamily: 'satoshi-medium', fontSize: 15.sp)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6.w),
                        child: CachedNetworkImage(
                          imageUrl: leaguesDetailController.upcomingMatchesModel
                                  ?.matches?[index].awayTeamsLogos ??
                              "",
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
