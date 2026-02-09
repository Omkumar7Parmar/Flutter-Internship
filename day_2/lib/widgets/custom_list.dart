import 'package:day_2/widgets/products_showcase.dart';
import 'package:flutter/material.dart';
import 'package:day_2/data/product_list.dart';
import 'package:day_2/widgets/custom_list.dart';
import 'package:day_2/screens/screen3.dart';
class CustomList extends StatelessWidget {

  const CustomList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 3, itemBuilder: (context, index) => ListTile(
      title: TextButton(onPressed: (){
        String name = productList[index]["name"];
        String imagePath = productList[index]["imagePath"];
        String description = productList[index]["description"];
        Navigator.push(context, MaterialPageRoute(builder: (context) => ShowCase(name: name, imagePath: imagePath, description: description)));
      }, child: Text(productList[index]["name"], style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),)),
    ));
  }
}
