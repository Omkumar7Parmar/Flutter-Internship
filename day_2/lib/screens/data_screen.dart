import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:day_2/models/post_model.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  bool hasError = false;
  String errorMessage = "";
  List<Data> dataList = [];
  List dataList1 = [];

  void getData() async {
    try {
      final Map<String, String> requestHeaders = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36',
        'Accept': 'application/json',
      };

      Response response = await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"),headers: requestHeaders);
      if (response.statusCode == 200) {
        String jsonString = response.body;
        List<dynamic> jsonList = jsonDecode(jsonString);

        setState(() {
          dataList = jsonList.map((json) {
            final p = PostModel.fromJson(json);
            return Data(
              userId: p.userId.toString(),
              id: p.id.toString(),
              title: p.title,
              body: p.body,
            );
          }).toList();
          hasError = false;
        });
      } else {
        setState(() {
          hasError = true;
          errorMessage = "Server Error: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        hasError = true;
        errorMessage = "Connection Error: ${e.toString()}";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => getData());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Screen"), backgroundColor: Colors.orange,),
      body: hasError
          ? Center(child: Text(errorMessage))
          : dataList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final item = dataList[index];
                return ListTile(
                  leading: Text(item.id, style: TextStyle(fontSize: 25),),
                  title: Text(item.title),
                  subtitle: Text(item.body),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



class Data {
  String userId;
  String id;
  String title;
  String body;
  Data (
      {required this.userId, required this.id, required this.title, required this.body}
      );
}


