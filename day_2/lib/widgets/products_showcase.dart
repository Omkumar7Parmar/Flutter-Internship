import 'package:flutter/material.dart';
import 'package:day_2/data/product_list.dart';

class ProductsShowcase extends StatelessWidget {
  final String name;
  const ProductsShowcase({
    super.key,
    required this.name,
  });
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.grey,
      child: Text(name),
    );
  }
}
