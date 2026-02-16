import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:day_2/screens/loading_screen.dart';


class ListFromAPI extends StatefulWidget {
  final String id;
  final String title;

  const ListFromAPI({
    super.key,
    required this.id,
    required this.title,
  });

  @override
  State<ListFromAPI> createState() => _ListFromAPIState();
}

class _ListFromAPIState extends State<ListFromAPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post Detail")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) =>
                  ListTile(
                    title: Text(widget.title),
                    subtitle: Text("ID: ${widget.id}"),
                  ),
            ),
          )
        ],
      ),
    );
  }
}