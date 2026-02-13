import 'package:day_2/data/product_list.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    final args1 = ModalRoute.of(context)!.settings.arguments as FormArguments;



    return Scaffold(
      appBar: AppBar(
        title: Text("Third Screen"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(args1.firstName, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
              Text(args1.lastName, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
              Text(args1.email, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),

            ],
          ),
        ),
      )
    );
  }
}
