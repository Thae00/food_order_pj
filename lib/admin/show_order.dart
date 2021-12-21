import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_order_pj/auth/order.dart';

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
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: Order().getOrder(widget.id),
          builder: (context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot) {
            if(!snapshot.hasData){
              return Text("loading...");
            }
            if(snapshot.data!.docs.isEmpty){
              return Text("You have no messages");
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Text("Helllllo");
              },
            );
          },
        ),
      ),
    );
  }
}
