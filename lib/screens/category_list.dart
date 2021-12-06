import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  Stream<QuerySnapshot> categories =
      FirebaseFirestore.instance.collection("categories").snapshots();
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
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
