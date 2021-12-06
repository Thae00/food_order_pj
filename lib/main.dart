import 'package:flutter/material.dart';
import 'package:food_order_pj/screens/home.dart';
import 'package:food_order_pj/screens/palette.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Palette.bgColor,
      ),
      home: Home(),
    );
  }
}
