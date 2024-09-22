import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/splash_screen/splash_screen.dart';
import 'home_screen/home_screen_ui/custome_buttom_navigation_bar.dart';
import 'home_screen/home_screen_ui/home_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412,870),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
          home: CustomeButtomNavigationBar(),
          );
        });
  }

}