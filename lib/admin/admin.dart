import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_order_pj/auth/order.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Pannel'),),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: Order().getCustomers(),
          builder: (context,AsyncSnapshot<QuerySnapshot> snapshots){
            if (!snapshots.hasData) {
              return Text('Loading...');
            }
            if (snapshots.data!.docs.isEmpty) {
              return Text('You have no messages.');
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshots.data!.docs.length,
                itemBuilder: (context, index){
                return Text("Hay");
                });
          },
        ),
      ),
    );
  }
}
