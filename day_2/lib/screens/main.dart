import 'package:day_2/widgets/custom_list.dart';
import 'package:flutter/material.dart';
import 'screen2.dart'; // Ensure this matches your filename
import '/data/product_list.dart';
import 'package:day_2/widgets/custom_card.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("This is AppBar"),backgroundColor: Colors.red, centerTitle: true,),
        body: CustomList(),
      ),
    );
  }
}

