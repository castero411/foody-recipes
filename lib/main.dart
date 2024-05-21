import 'package:flutter/material.dart';
import 'package:mobydoby/Pages/StartPage/Page.dart';
import 'package:mobydoby/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'food app',
      home: startPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
