import 'package:flutter/material.dart';
import 'package:food_order_pj/screens/category_list.dart';
import 'package:food_order_pj/screens/image_slider.dart';
import 'package:food_order_pj/screens/palette.dart';
import 'package:food_order_pj/screens/search_box.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Palette.bgColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchBox(),
            ImageSlider(),
            CategoryList(),
          ],
        ),
      ),
    );
  }
}
