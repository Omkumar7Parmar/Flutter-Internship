import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Welcome To My App",

      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome to the App"),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(child: Text(
          "Omkumar",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.white,
            backgroundColor: Colors.grey,
            fontSize: 40,
          ),
          ),
        ),


      ),

    );
  }
}
