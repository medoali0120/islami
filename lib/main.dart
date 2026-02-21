import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/route_manger/route_manger.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var isFirstTime = preferences.getBool("FirstTime") ?? true;
  runApp(Islami(isFirstTime: isFirstTime));
}

class Islami extends StatelessWidget {
  const Islami({super.key, required this.isFirstTime});
  final bool isFirstTime;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: RouteManger.routes,
        initialRoute: isFirstTime
            ? RouteManger.onBoardingScreen
            : RouteManger.mainLayout,
      ),
    );
  }
}
