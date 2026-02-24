import 'package:flutter/material.dart';
import 'package:http/http.dart';

class StateManagement extends StatefulWidget {
  const StateManagement({super.key});

  @override
  State<StateManagement> createState() => _StateManagementState();
}

class _StateManagementState extends State<StateManagement> {
  int _counter = 0;
  bool _isSwitched = false;
  bool _isLoading = false;

  Future<void> getResponse() async {
    setState(() => _isLoading = true);

    try {
      final response = await get(Uri.parse("https://flutter.free.beeceptor.com/"));

      if (!mounted) return;
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Data fetched successfully"), backgroundColor: Colors.green),
        );
      } else {
        throw Exception("Server Error");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Connection Error"), backgroundColor: Colors.red),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("State Management"), backgroundColor: Colors.orange),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_isLoading) const CircularProgressIndicator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () => setState(() => _counter++), child: const Text("+")),
              Text("   $_counter   "),
              ElevatedButton(onPressed: () => setState(() => _counter--), child: const Text("-")),
            ],
          ),
          Switch(
              value: _isSwitched,
              onChanged: (val) => setState(() => _isSwitched = val)
          ),
          ElevatedButton(
            onPressed: _isLoading ? null : getResponse,
            child: const Text("Simple API call"),
          )
        ],
      ),
    );
  }
}
