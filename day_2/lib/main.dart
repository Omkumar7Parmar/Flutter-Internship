// import 'dart:ffi';

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
          title: Text("Hello User"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/profile.png')),
              Text("Omkumar Parmar"),
              Text("I am a Developer"),
              ElevatedButton(
                onPressed: () {
                  print("Button was pressed");
                },
                child: Text("Press this"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
