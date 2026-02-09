import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double height;
  final double width;
  // final double margin;


  const CustomCard({
    required this.height,
    required this.width,
    // required this.margin,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.grey,
      child: Center(child: Text("Custom Card")),
    );
  }
}
