import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_order_pj/auth/login_status.dart';
import 'package:food_order_pj/carts/cart.dart';
import 'package:food_order_pj/screens/home.dart';
import 'package:food_order_pj/screens/login_screen.dart';
import 'package:food_order_pj/screens/palette.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => LoginStatus()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    bool status = Provider.of<LoginStatus>(context).getStatus();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Palette.bgColor,
      ),
      home: (status) ? Home() : LoginScreen(),
    );
  }
}
