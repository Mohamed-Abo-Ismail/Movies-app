import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../home_screen/home_screen_ui/custom_bottom_navigation_bar.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void intiState(){
    super.initState();
    Timer( const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=> CustomBottomNavigationBar()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset('assets/movies splash.png'),
            const Spacer(),
            Column(
              children: [
                Image.asset('assets/route yellow 2.png'),
                const Text(
                  'Supervised by Mohamed Nabil',
                  style: TextStyle(color: Color(0xffFFBB3B), fontSize: 15),
                ),
                SizedBox(
                  height: 10.h,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
