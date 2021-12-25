import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_order_pj/admin/show_order.dart';
import 'package:food_order_pj/auth/order.dart';
import 'package:food_order_pj/screens/palette.dart';
import 'package:food_order_pj/screens/user_location.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Pannel',
          style: TextStyle(color: Palette.titleColor),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: Order().getCustomers(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
            if (!snapshots.hasData) {
              return Text('Loading...');
            }
            if (snapshots.data!.docs.isEmpty) {
              return Text('You have no messages.');
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshots.data!.docs.length,
              itemBuilder: (context, index) {
                //return Text("Hay");
                return Card(
                  color: Palette.boxColor,
                  elevation: 5,
                  shadowColor: Palette.priceColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: Text(
                          "${snapshots.data!.docs[index]['email']}",
                          style: TextStyle(
                            color: Palette.titleColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowOrder(
                                snapshots.data!.docs[index].id,
                                snapshots.data!.docs[index]['total'],
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Palette.priceColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserLocation(
                                snapshots.data!.docs[index]['lat'],
                                snapshots.data!.docs[index]['log'],
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.map_sharp,
                          color: Palette.showColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Order().deleteOrder(snapshots.data!.docs[index].id);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Palette.speciColor,
                        ),
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
