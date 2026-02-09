import 'package:flutter/material.dart';
import 'package:day_2/data/product_list.dart';
import 'main.dart';
import 'package:day_2/widgets/products_showcase.dart';


class ShowCase extends StatelessWidget {
  final String name;
  final String imagePath;
  final String description;
  // ShowCase({required this.name, required this.data});

  const ShowCase({super.key,
    required this.name,
    required this.imagePath,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product ShowCase"),backgroundColor: Colors.yellow,),
      body: Center(
        child: Container(
          height: 350,
          width: 350,
          decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 4)),

          child: Column(
            children: [
              Center(child: Text(name, style: TextStyle(fontSize: 20),),),
              Center(child: Image.asset(imagePath, height: 280, width: 280,)),
              Center(child: Text(description, style: TextStyle(fontSize: 20),),),
            ],
          ),
        ),
      ),
    );
  }
}
