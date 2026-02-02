import 'package:flutter/material.dart';

void main(){




}
class secondScreen extends StatelessWidget {
  const secondScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        child: Text("Click Back for Home Screen", style: TextStyle(fontSize: 30),),

      ),

    );
  }
}
