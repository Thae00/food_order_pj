import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order_pj/auth/auth.dart';
import 'package:food_order_pj/auth/login_status.dart';
import 'package:food_order_pj/main.dart';
import 'package:food_order_pj/screens/body.dart';
import 'package:food_order_pj/screens/palette.dart';
import 'package:provider/provider.dart';

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
        onTap: (index){
          if(index == 2){
            Auth().logout();
            Provider.of<LoginStatus>(context,listen: false).setStatus(false);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
          }
        },
        selectedItemColor: Palette.speciColor,
        unselectedItemColor: Palette.showColor,
        backgroundColor: Palette.boxColor,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.home,
              color: Palette.titleColor,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shop,
              color: Palette.titleColor,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.logout,
              color: Palette.titleColor,
            ),
            label: "Logout",
          ),
        ],
      ),
      body: Body(),
    );
  }
}
