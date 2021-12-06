import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order_pj/screens/body.dart';
import 'package:food_order_pj/screens/palette.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
            children: [
              TextSpan(
                text: 'Food',
                style: TextStyle(
                  color: Palette.titleColor,
                ),
              ),
              TextSpan(
                text: 'Order',
                style: TextStyle(
                  color: Palette.speciColor,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset("assets/icons/bag.svg"))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shop,
              ),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.logout,
              ),
              label: "Logout"),
        ],
      ),
      body: Body(),
    );
  }
}
