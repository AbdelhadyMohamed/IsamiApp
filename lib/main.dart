import 'package:flutter/material.dart';
import 'package:islami_app/ahadeeth_details.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/sura_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route: (context) => HomeScreen(),
        SuraDetails.route: (context) => SuraDetails(),
        AhadeethDetails.route: (context) => AhadeethDetails(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
