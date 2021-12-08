import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllProductList extends StatefulWidget {
  const AllProductList({Key? key}) : super(key: key);

  @override
  _AllProductListState createState() => _AllProductListState();
}

class _AllProductListState extends State<AllProductList> {
  Stream<QuerySnapshot> allProducts =
      FirebaseFirestore.instance.collection("products").snapshots();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder(
        stream: allProducts,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
          return GridView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: snapshots.data!.docs.length,
            itemBuilder: (BuildContext context, index) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Image.network(
                        "${snapshots.data!.docs[index]['img']}",
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
