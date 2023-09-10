import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../controllers/leagues_detail.dart';

class BuildTeams extends StatefulWidget {
  const BuildTeams({super.key});

  @override
  State<BuildTeams> createState() => _BuildTeamsState();
}

class _BuildTeamsState extends State<BuildTeams> {
  @override
  Widget build(BuildContext context) {
    LeaguesDetailController leaguesDetailController =
        Provider.of<LeaguesDetailController>(context);
    if (leaguesDetailController.isLoadingTeams) {
      return const CircularProgressIndicator.adaptive();
    } else if (leaguesDetailController.teamsModel == null) {
      return const SizedBox();
    } else if (leaguesDetailController.teamsModel?.teams == null) {
      return const SizedBox();
    } else if (leaguesDetailController.teamsModel?.teams?.isEmpty == true) {
      return const SizedBox();
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 12.w),
        child: Scrollbar(
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: leaguesDetailController.teamsModel?.teams?.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? 3
                      : 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: (2 / 1),
            ),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 60.w,
                    //width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            leaguesDetailController
                                    .teamsModel?.teams?[index].logo ??
                                "",
                          ),
                          fit: BoxFit.contain),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Text(
                      leaguesDetailController.teamsModel?.teams?[index].name ??
                          "",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'satoshi-medium',
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      );
    }
  }
}
