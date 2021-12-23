import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order_pj/admin/admin.dart';
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

  bool status = false;
  @override
  void initState() {
    super.initState();
    checkRole();
  }
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
        onTap: (index) {
          if (index == 3) {
            Auth().logout();
            Provider.of<LoginStatus>(context, listen: false).setStatus(false);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MyApp()));
          } else if (index == 2){
            if(this.status){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Admin()));
            }
          }
        },
        selectedItemColor: Palette.speciColor,
        unselectedItemColor: Palette.showColor,
        backgroundColor: Palette.boxColor,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
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
          status ?
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Palette.titleColor),
            label: "admin",
          ) : BottomNavigationBarItem(
            icon: Icon(Icons.verified_user, color: Palette.titleColor),
            label: "Normal User",
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

  checkRole() async {
    QuerySnapshot<Map<String,dynamic>> roles = await FirebaseFirestore.instance.collection("role").where("user_id", isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
    if(roles.docs[0]['role'] == "admin"){
      setState(() {
        this.status = true;
      });
    }
  }
}
