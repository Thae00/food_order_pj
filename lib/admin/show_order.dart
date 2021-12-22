import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_order_pj/auth/order.dart';
import 'package:food_order_pj/screens/palette.dart';

class ShowOrder extends StatefulWidget {
  String id;
  ShowOrder(this.id);

  @override
  _ShowOrderState createState() => _ShowOrderState();
}

class _ShowOrderState extends State<ShowOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order List with customer's Id"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: Order().getOrder(widget.id),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return Text("loading...");
            }
            if (snapshot.data!.docs.isEmpty) {
              return Text("You have no messages");
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Palette.bgColor,
                  child: Row(
                    children: [
                      Image.network(
                        snapshot.data!.docs[index]['img'],
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            child: Text(
                              snapshot.data!.docs[index]['name'],
                              style: TextStyle(
                                color: Palette.titleColor,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "${snapshot.data!.docs[index]['price']} MMK",
                              style: TextStyle(
                                color: Palette.priceColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            "Qty",
                            style: TextStyle(
                              color: Palette.titleColor,
                            ),
                          ),
                          Text(
                            "${snapshot.data!.docs[index]['qty']}",
                            style: TextStyle(
                              color: Palette.speciColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            "Amount",
                            style: TextStyle(
                              color: Palette.titleColor,
                            ),
                          ),
                          Text(
                            "${snapshot.data!.docs[index]['qty'] * snapshot.data!.docs[index]['price']}",
                            style: TextStyle(
                              color: Palette.priceColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
