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
              return Card(
                child: Row(
                  children: [
                    Image.network(cart.getList()[index].product.img, width: 100, height: 100,),
                    Column(
                      children: [
                        Container(
                          child: Text(cart.getList()[index].product.name, style: TextStyle(color: Colors.red),),
                        ),
                        Container(child: Text("${cart.getList()[index].product.price}")),
                      ],
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
