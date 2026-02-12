import 'package:day_2/screens/screen3.dart';
import 'package:day_2/widgets/custom_list.dart';
import 'package:flutter/material.dart';
import 'package:day_2/screens/screen2.dart';
import '/data/product_list.dart';
import 'package:day_2/widgets/custom_card.dart';
import 'package:day_2/screens/local_storage.dart';
import 'package:day_2/screens/home_screen.dart';
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
        'secondScreen': (context) => ScreenScreen(),
        'thirdScreen': (context) => ThirdScreen(),
      },
      home: HomeScreen(),
    );
  }
}

