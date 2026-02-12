import 'package:day_2/data/product_list.dart';
import 'package:flutter/material.dart';
import 'package:day_2/screens/screen3.dart';
class ScreenScreen extends StatelessWidget {
  
  const ScreenScreen ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              Navigator.pushNamed(context, 'thirdScreen', arguments: ScreenArguments(name: productList[0]["name"], description: productList[1]["description"]));
            }, child: Text("Dog", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)),

            TextButton(onPressed: (){
              Navigator.pushNamed(context, 'thirdScreen', arguments: ScreenArguments(name: productList[1]["name"], description: productList[1]["description"]));

            }, child: Text("Cat", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)),
            TextButton(onPressed: (){
              Navigator.pushNamed(context, 'thirdScreen', arguments: ScreenArguments(name: productList[2]["name"], description: productList[1]["description"]));

            }, child: Text("Duck", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)),
          ],
        ),

      ),

    );
  }
}