import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order_pj/screens/palette.dart';

class DiscountCard extends StatefulWidget {
  const DiscountCard({Key? key}) : super(key: key);

  @override
  _DiscountCardState createState() => _DiscountCardState();
}

class _DiscountCardState extends State<DiscountCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Offers & Discount",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Palette.speciColor,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 170,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/food1.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: SvgPicture.asset("assets/icons/macdonalds.svg"),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Get Discount of\n",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        TextSpan(
                          text: "30%",
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Palette.speciColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
