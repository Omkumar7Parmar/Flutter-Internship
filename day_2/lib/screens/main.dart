import 'package:flutter/material.dart';
import 'screen2.dart'; // Ensure this matches your filename
import '/data/product_list.dart';
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
            // CircleAvatarWidget(),
            // UserName(),
            // EmailID(),
            // Stats(),
            // // WorkTime(),
            // StackUsingDuck(),
            ProductList(),
            // Padding(padding: EdgeInsets.only(top: 25)),
            Divider(thickness: 2, color: Colors.black,),
            GridViewBuilder(),
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

class Stats extends StatelessWidget {
  const Stats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Padding(padding: EdgeInsetsGeometry.only()),
        Column(
          children: [
            Text("Screen Time", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w300),),
            Text("7 Hours",style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w300))
          ],
        ),
        // Padding(padding: EdgeInsets.only()),
        Column(
          children: [
            Text("Work Time", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w300),),
            Text("8 Hours", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w200))
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

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 20,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index){
            return ListTile(title: Text(productList[index].values.first),);
          }
      ),
    );
  }
}

class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(itemCount:30,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4), itemBuilder: (context, index){
          return Column(
            children: [
              Icon(Icons.shopping_bag, size: 35,),
              Text(productList[index].values.first),
              Text("Description")
            ],
          );
        })
    );
  }
}

