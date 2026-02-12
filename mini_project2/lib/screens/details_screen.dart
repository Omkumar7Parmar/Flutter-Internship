import 'package:mini_project2/data/product_list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DetailsScreen extends StatefulWidget {
  final String productName;
  final String productDescription;

   const DetailsScreen({
    super.key,
    required this.productName,
    required this.productDescription,
  });
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

String ratings = "";

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Product Details", style: TextStyle(fontSize: 25),),
          backgroundColor: Colors.orange,
        ),
        body: Center(
          child: Column(
            children: [
              Text(widget.productName, style: TextStyle(fontSize: 25),),
              Text(widget.productDescription, style: TextStyle(fontSize: 20),),
              Text(ratings, style: TextStyle(fontSize: 20),),

            ],
          ),
        ),
      ),
    );
  }
}
