import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home_screen/home_screen_ui/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      //Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
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
