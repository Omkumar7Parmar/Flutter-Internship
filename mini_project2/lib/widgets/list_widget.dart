import 'package:flutter/material.dart';
import 'package:mini_project2/data/product_list.dart';
import 'package:mini_project2/screens/details_screen.dart';

class CustomList extends StatelessWidget {
  const CustomList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productList.length,
      itemBuilder: (context, index) {
        final product = productList[index];
        return ListTile(
          title: Text(product["Name"] ?? ""),
          subtitle: Text(product["Description"] ?? ""),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  productName: product["Name"] ?? "",
                  productDescription: product["Description"] ?? "",
                ),
              ),
            );
          },
        );
      },
    );
  }
}
