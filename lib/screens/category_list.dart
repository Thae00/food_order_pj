import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_order_pj/screens/palette.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  Stream<QuerySnapshot> categories =
      FirebaseFirestore.instance.collection("categories").snapshots();

  //For Products
  String defaultId = "17HG5bLQyTCyRYy8gpl1";
  Future<QuerySnapshot<Map<String, dynamic>>> categoryProducts =
      FirebaseFirestore.instance
          .collection("products")
          .where("category", isEqualTo: "17HG5bLQyTCyRYy8gpl1")
          .get();
  //
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: categories,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
            return Container(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshots.data!.docs.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "${snapshots.data!.docs[index]['name']}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Palette.titleColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
        // For products
        SingleChildScrollView(
          child: FutureBuilder(
            future: categoryProducts,
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshots) {
              return Container(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (context, index) {
                    //return Text("${snapshots.data!.docs[index]['name']}");
                    return Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 0,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Palette.boxColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                "${snapshots.data!.docs[index]['name']}",
                                style: TextStyle(
                                  color: Palette.titleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Image.network(
                                "${snapshots.data!.docs[index]['img']}",
                                height: 120,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
