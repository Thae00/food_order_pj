import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order_pj/carts/cart.dart';
import 'package:food_order_pj/carts/cart_product.dart';
import 'package:food_order_pj/models/product.dart';
import 'package:food_order_pj/screens/palette.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  String id;
  Product product;
  DetailScreen(this.id, this.product);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int counter = 0;
  int updateCounter = 0;
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/bag.svg",
                  color: Palette.speciColor,
                ),
                Text(
                  "${cart.getLength()}",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        color: Palette.boxColor,
        child: Column(
          children: [
            Column(
              children: [
                Image.network(
                  widget.product.img,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      decoration: BoxDecoration(
                        color: Palette.bgColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.room_service,
                                  color: Palette.speciColor),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            widget.product.name,
                                            style: TextStyle(
                                              color: Palette.titleColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Palette.speciColor,
                                        ),
                                        width: 50,
                                        height: 50,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(left: 15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${widget.product.price}",
                                              style: TextStyle(
                                                  color: Palette.titleColor),
                                            ),
                                            Text(
                                              "MMK",
                                              style: TextStyle(
                                                  color: Palette.titleColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            widget.product.description,
                            style: TextStyle(
                                color: Palette.showColor, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (this.counter != 0) {
                              setState(() {
                                this.counter--;
                              });
                            }
                            if(this.updateCounter + cart.getCount(CartProduct(this.counter, widget.product)) != 0){
                              setState(() {
                                this.updateCounter--;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.remove_circle,
                            color: Palette.speciColor,
                          ),
                        ),
                        cart.has(CartProduct(this.counter, widget.product))
                            ? Text(
                                "${updateCounter + cart.getCount(CartProduct(this.counter, widget.product))}",
                                style: TextStyle(
                                  color: Palette.priceColor,
                                  fontSize: 20,
                                ),
                              )
                            : Text(
                                "${counter}",
                                style: TextStyle(
                                  color: Palette.priceColor,
                                  fontSize: 20,
                                ),
                              ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              this.counter++;
                            });

                            if(cart.has(CartProduct(this.counter, widget.product))){
                              setState(() {
                                this.updateCounter++;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.add_circle,
                            color: Palette.speciColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Palette.speciColor,
                      ),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: InkWell(
                        onTap: () {
                          // CartProduct cartProduct =
                          //     CartProduct(this.counter, widget.product);
                          // cart.add(cartProduct);

                          //list have condition => true or false
                          CartProduct cartProduct = CartProduct(this.counter, widget.product);
                          if(cart.has(cartProduct)){
                            print(updateCounter);
                            cart.updateProduct(cartProduct, updateCounter + cart.getCount(CartProduct(this.counter, widget.product)));
                            setState(() {
                              updateCounter = 0;
                            });
                          } else {
                            cart.add(cartProduct);
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/bag.svg"),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Order Now",
                                style: TextStyle(
                                  color: Palette.titleColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
