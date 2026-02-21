import 'package:flutter/material.dart';

class GetApiScreen extends StatefulWidget {
  const GetApiScreen({super.key});

  @override
  State<GetApiScreen> createState() => _GetApiScreenState();
}

class _GetApiScreenState extends State<GetApiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fetch Data From GET APIs"), backgroundColor: Colors.red,),
      body: Center(
        child: ElevatedButton(onPressed: (){

          Navigator.pushNamed(context, 'dataScreen');
        }, child: Text("Fetch Data"),),
      ),
    );
  }
}
