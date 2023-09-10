import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlygoal/src/controllers/home_controller.dart';
import 'package:provider/provider.dart';

import '../leagues_detail/leagues_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    HomeController vm = Provider.of<HomeController>(context, listen: false);
    vm.getLeagues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeController vm = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Ligler',
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
      body: vm.isLoading
          ? const SizedBox()
          : Builder(
              builder: (context) {
                if (vm.leaguesModel == null) {
                  return const SizedBox();
                } else if (vm.leaguesModel?.leagues == null) {
                  return const SizedBox();
                } else {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SizedBox(
                            child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: vm.leaguesModel!.leagues!.length,
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemBuilder: (context, index) {
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Image.network(
                                    vm.leaguesModel?.leagues?[index].logo ?? "",
                                    height: 34,
                                    width: 34,
                                  ),
                                  title: Text(
                                    vm.leaguesModel?.leagues?[index].name ?? "",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => LeaguesDetail(
                                          leagueTitle: vm.leaguesModel
                                                  ?.leagues?[index].name ??
                                              "",
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
    );
  }
}
