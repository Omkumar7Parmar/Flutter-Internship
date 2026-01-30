// import 'dart:ffi';
//
// AppBar with title
// Scrollable body
// At least 2 UI sections (example: Profile section + Settings section)
// One ListView (static or builder)
// Proper spacing (Padding / SizedBox)
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Welcome To My App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello User"),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: SingleChildScrollView(  // Wrap the Column here for full scrollability
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.red,
                width: double.infinity,
                child: Column(
                  children: [
                    const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
                    const SizedBox(height: 10), // Spacing
                    const Text("Omkumar Parmar", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const Divider(height: 1, thickness: 1),
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.blue,
                width: double.infinity,
                child: Column(
                  children: [
                    const Icon(Icons.settings, size: 100),
                    const Text("Settings", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const Divider(height: 1, thickness: 1),
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.green,
                width: double.infinity,
                child: Column(
                  children: [
                    const Icon(Icons.phone, size: 100),
                    const Text("Contact Us", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const Divider(height: 1, thickness: 1),
              // No Expanded needed now; ListView can grow within the scroll view
              ListView.builder(
                shrinkWrap: true,  // Add this to allow it to size itself within the Column
                physics: const NeverScrollableScrollPhysics(),  // Disable inner scrolling (outer handles it)
                itemCount: 50,
                itemBuilder: (context, index) => ListTile(title: Text("Item ${index + 1}")),
              ),
            ],
          ),
        ),
      )
    );
  }
}
