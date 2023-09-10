import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlygoal/src/controllers/home_controller.dart';
import 'package:onlygoal/src/controllers/leagues_detail.dart';
import 'package:onlygoal/src/controllers/percentage_controller.dart';
import 'package:provider/provider.dart';
import 'src/pages/home/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<HomeController>(
                create: (_) => HomeController()),
            ChangeNotifierProvider<LeaguesDetailController>(
                create: (_) => LeaguesDetailController()),
            ChangeNotifierProvider<PercentageController>(
                create: (_) => PercentageController()),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              fontFamily: 'satoshi-regular',
            ),
            home: const HomePage(),
          ),
        );
      },
    );
  }
}
