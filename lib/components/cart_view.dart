import 'package:flutter/material.dart';
import 'package:food_order_pj/carts/cart.dart';
import 'package:food_order_pj/screens/palette.dart';
import 'package:provider/provider.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart List'),
      ),
      body: Container(
        color: Palette.bgColor,
        child: Column(
          children: [
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: cart.getLength(),
              itemBuilder: (context, index) {
                return Card(
                  color: Palette.boxColor,
                  margin: EdgeInsets.all(5),
                  elevation: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        cart.getList()[index].product.img,
                        width: 100,
                        height: 100,
                      ),
                      Column(
                        children: [
                          Container(
                            child: Text(
                              cart.getList()[index].product.name,
                              style: TextStyle(color: Palette.titleColor),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            child: Text(
                              "${cart.getList()[index].product.price} MMK",
                              style: TextStyle(
                                color: Palette.priceColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            "Qty",
                            style: TextStyle(color: Palette.titleColor),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "${cart.getList()[index].counter}",
                            style: TextStyle(
                              color: Palette.speciColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            'Amount',
                            style: TextStyle(color: Palette.titleColor),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${cart.getList()[index].counter * cart.getList()[index].product.price}",
                            style: TextStyle(
                              color: Palette.priceColor,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            cart.deleteProduct(cart.getList()[index]);
                          });
                        },
                        child: Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}