import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gmap/loginPage.dart';
import 'package:gmap/signUp.dart';
import 'package:gmap/simple_map.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/loginPage": (context) => login_page(),
        "/signUp": (context) => signUp(),
        "/map": (context) => MapScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: login_page(),
    );
  }
}
