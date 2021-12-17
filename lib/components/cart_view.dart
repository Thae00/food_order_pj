import 'package:flutter/material.dart';
import 'package:food_order_pj/carts/cart.dart';
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
      appBar: AppBar(title: Text('Cart List'),),
      body: Column(
        children: [
          ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: cart.getLength(),
            itemBuilder: (context, index) {
              return Text(cart.getList()[index].product.name);
            },
          )
        ],
      ),
    );
  }
}
