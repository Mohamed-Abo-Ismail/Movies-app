import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/splash_screen/splash_screen.dart';
import 'Browse_screen/browse_cubit.dart';
import 'home_screen/home_screen_ui/custom_bottom_navigation_bar.dart';
import 'home_screen/home_screen_ui/home_screen.dart';



void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BrowseCubit>(create: (context)=>BrowseCubit()..loadGenres())
      ],
      child: ScreenUtilInit(
          designSize: const Size(412,870),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
            home: CustomBottomNavigationBar(),
            );
          }),
    );
  }

}