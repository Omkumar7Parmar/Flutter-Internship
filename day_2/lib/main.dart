import 'package:day_2/screens/loading_screen.dart';
import 'package:day_2/screens/screen3.dart';
import 'package:flutter/material.dart';
import 'package:day_2/screens/screen2.dart';
import 'package:day_2/screens/home_screen.dart';
import 'package:day_2/screens/get_api_screen.dart';
import 'package:day_2/screens/data_screen.dart';
import 'package:day_2/screens/state_management.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'providers/posts_provider.dart';
import 'package:day_2/screens/auth/signup.dart';
import 'package:day_2/screens/auth/login.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      Provider.of<PostsProvider>(context, listen: false).fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'signup',
      routes: {
        'homeScreen': (context) => HomeScreen(),
        'secondScreen': (context) => SecondScreen(),
        'thirdScreen': (context) => ThirdScreen(),
        'loadingScreen': (context) => LoadingScreen(),
        'getApiScreen': (context) => GetApiScreen(),
        'dataScreen': (context) => DataScreen(),
        'stateManagement': (context) => StateManagement(),
        'login': (context) => Login(),
        'signup': (context) => Signup(),
      },
      home: Signup(),
    );
  }
}

