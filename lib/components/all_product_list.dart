import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order_pj/components/detail_screen.dart';
import 'package:food_order_pj/models/product.dart';
import 'package:food_order_pj/screens/palette.dart';

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
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
            ),
            itemCount: snapshots.data!.docs.length,
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: () {
                  Product product = Product(
                    snapshots.data!.docs[index]['name'],
                    snapshots.data!.docs[index]['price'],
                    snapshots.data!.docs[index]['description'],
                    snapshots.data!.docs[index]['img'],
                    snapshots.data!.docs[index]['shop'],
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(snapshots.data!.docs[index].id, product),
                    ),
                  );
                },
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Palette.boxColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        Container(
                          child: Image.network(
                            "${snapshots.data!.docs[index]['img']}",
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                "${snapshots.data!.docs[index]['name']}",
                                style: TextStyle(
                                  color: Palette.titleColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "${snapshots.data!.docs[index]['price']} MMK",
                                      style: TextStyle(
                                        color: Palette.priceColor,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Palette.speciColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: SvgPicture.asset(
                                        "assets/icons/bag.svg",
                                        width: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
