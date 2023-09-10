import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlygoal/src/utils/color_manager.dart';
import 'package:provider/provider.dart';

import '../../../controllers/leagues_detail.dart';

class BuildResults extends StatefulWidget {
  const BuildResults({super.key});

  @override
  State<BuildResults> createState() => _BuildResultsState();
}

class _BuildResultsState extends State<BuildResults> {
  @override
  Widget build(BuildContext context) {
    LeaguesDetailController leaguesDetailController =
        Provider.of<LeaguesDetailController>(context);
    if (leaguesDetailController.isLoadingLeaguesResult) {
      return const CircularProgressIndicator.adaptive();
    } else if (leaguesDetailController.leaguesResult == null) {
      return const SizedBox();
    } else if (leaguesDetailController.leaguesResult!.isEmpty) {
      return const SizedBox();
    } else if (leaguesDetailController.leaguesResult?[0] == null) {
      return const SizedBox();
    } else if (leaguesDetailController.leaguesResult?[0] == []) {
      return const SizedBox();
    } else {
      return Padding(
        padding: EdgeInsets.only(top: 8.w),
        child: Scrollbar(
          child: ListView.builder(
              reverse: true,
              shrinkWrap: true,
              itemCount: leaguesDetailController.leaguesResult?[0].length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: ColorManager.instance.bgContainer,
                      ),
                      child: Text("Hafta ${index + 1}"),
                    ),
                    SizedBox(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: leaguesDetailController
                            .leaguesResult?[0]["${index + 1}"].length,
                        itemBuilder: (context, index2) {
                          var data = leaguesDetailController.leaguesResult?[0]
                              ["${index + 1}"][index2];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 8.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //! HOME TEAM
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: data['HomeTeamsLogos'],
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.w),
                                      child: Text(data['HomeTeam'],
                                          style: TextStyle(
                                              fontFamily: 'satoshi-medium',
                                              fontSize: 15.sp)),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.w),
                                          child: Text(
                                            "${data["HomeTeamFullTimeGoals"]} ",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontFamily: 'satoshi-medium',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 12.w),
                                          child: Text(
                                            "(${data["HomeTeamFirstHalfGoals"]}) ",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontFamily: 'satoshi-bold',
                                                color: ColorManager
                                                    .instance.greyText),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //! AWAY TEAM
                                Padding(
                                  padding: EdgeInsets.only(top: 6.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: data['AwayTeamsLogos'],
                                        height: 30,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.w),
                                        child: Text(data['AwayTeams'],
                                            style: TextStyle(
                                                fontFamily: 'satoshi-medium',
                                                fontSize: 15.sp)),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.w),
                                            child: Text(
                                              "${data["AwayTeamFullTimeGoals"]} ",
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontFamily: 'satoshi-medium',
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 12.w),
                                            child: Text(
                                              "(${data["AwayTeamFirstHalfGoals"]}) ",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontFamily: 'satoshi-bold',
                                                  color: ColorManager
                                                      .instance.greyText),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider()
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }),
        ),
      );
    }
  }
}
