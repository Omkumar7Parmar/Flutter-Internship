import 'package:flutter/material.dart';
import 'screen2.dart'; // Ensure this matches your filename

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
        body: Column(
          children: [
            CircleAvatarWidget(),
            UserName(),
            EmailID(),
            StackUsingDuck(),
          ],
        )
      ),
    );
  }
}

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(20.0)),
        Center(
          child: CircleAvatar(
            backgroundColor: Colors.yellow,
            radius: 65,
          child: Text("Circle Avatar"),),
        )
      ],
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: 30.0)),
            Text("Omkumar Parmar", style: TextStyle(fontSize: 20, ),),
          ]
        )
      ],
    );
  }
}
class EmailID extends StatelessWidget {
  const EmailID({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: 30.0)),
            Text("opomkumar904@gmail.com", style: TextStyle(fontSize: 20,),),
          ],
        )
      ],
    );
  }
}

class StackUsingDuck extends StatelessWidget {
  const StackUsingDuck({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.only(top: 20)),
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Image.asset("assets/images/duck.jpg", scale: 1,),
            Text("Duck", style: TextStyle(fontSize: 25, color: Colors.black),)
          ],
        )
      ]
    );
  }
}
