import 'package:flutter/material.dart';
import 'package:mini_project2/widgets/list_widget.dart';
import 'package:mini_project2/services/local_storage_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _savedValue = 'No value saved yet';

  @override
  void initState() {
    super.initState();
    _loadSavedValue();
  }

  Future<void> _loadSavedValue() async {
    final value = await LocalStorageService.getValue('user_name');
    if (value != null) {
      setState(() {
        _savedValue = value;
      });
    }
  }

  Future<void> _saveValue(String value) async {
    await LocalStorageService.saveValue('user_name', value);
    setState(() {
      _savedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Saved Local Value: $_savedValue'),
                ElevatedButton(
                  onPressed: () => _saveValue('Hello'),
                  child: const Text('Save "Hello" to Local Storage'),
                ),
                ElevatedButton(
                    onPressed: () => _saveValue(''),
                    child: const Text("Click to reset"))
              ],
            ),
          ),
          const Expanded(child: CustomList()),
        ],
      ),
    );
  }
}
