import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlygoal/src/controllers/percentage_controller.dart';
import 'package:provider/provider.dart';

class PercentagesPage extends StatefulWidget {
  final String hometeamname, awayteamname;
  const PercentagesPage(
      {super.key, required this.hometeamname, required this.awayteamname});

  @override
  State<PercentagesPage> createState() => _PercentagesPageState();
}

class _PercentagesPageState extends State<PercentagesPage> {
  @override
  void initState() {
    PercentageController percentageController =
        Provider.of<PercentageController>(context, listen: false);
    percentageController.getPercentage(
        widget.hometeamname, widget.awayteamname);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PercentageController percentageController =
        Provider.of<PercentageController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.hometeamname} - ${widget.awayteamname}',
          style: TextStyle(fontSize: 17.sp, fontFamily: 'satoshi-medium'),
        ),
      ),
      body: Builder(
        builder: (context) {
          if (percentageController.isLaoding) {
            return const CircularProgressIndicator.adaptive();
          } else if (percentageController.percentageModel == null) {
            return const SizedBox();
          } else if (percentageController.percentageModel?.data == null) {
            return const SizedBox();
          } else if (percentageController.percentageModel?.data?.isEmpty ==
              true) {
            return const SizedBox();
          } else {
            return SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Scrollbar(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        percentageController.percentageModel!.data!.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(5.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                percentageController
                                        .percentageModel?.data?[index].bahis ??
                                    "",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: 'satoshi-medium',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 7.w),
                              child: Text(
                                "%${percentageController.percentageModel!.data![index].yuzde!.toInt()}",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: 'satoshi-bold'),
                              ),
                            ),
                            SizedBox(
                              height: 10.w,
                              width: 80.w,
                              child: LinearProgressIndicator(
                                value: percentageController
                                        .percentageModel!.data![index].yuzde! /
                                    100,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ));
          }
        },
      ),
    );
  }
}
