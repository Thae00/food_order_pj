import 'package:flutter/material.dart';
import 'package:food_order_pj/screens/category_list.dart';
import 'package:food_order_pj/screens/image_slider.dart';
import 'package:food_order_pj/screens/search_box.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [SearchBox(), ImageSlider(), CategoryList()],
      ),
    );
  }
}
