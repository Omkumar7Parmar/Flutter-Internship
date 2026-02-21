import 'package:day_2/screens/loading_screen.dart';
import 'package:day_2/screens/screen3.dart';
import 'package:flutter/material.dart';
import 'package:day_2/screens/screen2.dart';
import 'package:day_2/screens/home_screen.dart';
import 'package:day_2/screens/get_api_screen.dart';
import 'package:day_2/screens/data_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'homeScreen',
      routes: {
        'homeScreen': (context) => HomeScreen(),
        'secondScreen': (context) => SecondScreen(),
        'thirdScreen': (context) => ThirdScreen(),
        'loadingScreen': (context) => LoadingScreen(),
        'getApiScreen': (context) => GetApiScreen(),
        'dataScreen': (context) => DataScreen(),

      },
      home: HomeScreen(),
    );
  }
}

