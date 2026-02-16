import 'package:day_2/widgets/custom_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool hasError = false;
  String errorMessage = "";
  void getData() async {
    setState(() => hasError = false);
    try{
      Response response = await get(Uri.parse("https://-json-server.typicode.com/typicode/demo/posts"));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        if (data.isNotEmpty && mounted) {
          String id = data[0]['id'].toString();
          String title = data[0]['title'];

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ListFromAPI(id: id, title: title),
            ),
          );
        }
      }
    }
    catch (e) {

      setState(() {
      hasError = true;
      errorMessage = "Server Error.";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: hasError
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMessage),
            SizedBox(height: 20),
            BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        )
            : CircularProgressIndicator(),
      ),
    );
  }
}



