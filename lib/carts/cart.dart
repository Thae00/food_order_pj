import 'package:flutter/cupertino.dart';
import 'package:food_order_pj/carts/cart_product.dart';

//For using Globel /provider
class Cart extends ChangeNotifier {
  List<CartProduct> cartProduct = [];

  add(CartProduct cartPro) {
    this.cartProduct.add(cartPro);
    notifyListeners();
  }

  getLength() {
    return this.cartProduct.length;
  }

  //CartProduct in List => condition with product's id
  has(CartProduct pro) {
    int status = 0;
    this.cartProduct.forEach((element) {
      if (element.product.id == pro.product.id) {
        status = 1;
      }
    });

    if (status == 1) {
      return true;
    }
    return false;
  }

  int getCount(CartProduct pro) {
    int counter = 0;
    this.cartProduct.forEach((element) {
      if (element.product.id == pro.product.id) {
        counter = element.counter;
      }
    });
    return counter;
  }

  updateProduct(CartProduct pro, int count) {
    this.cartProduct.forEach((element) {
      if (element.product.id == pro.product.id) {
        element.counter = count;
      }
    });
    notifyListeners();
  }
}
