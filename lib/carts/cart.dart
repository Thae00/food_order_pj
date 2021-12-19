import 'package:flutter/cupertino.dart';
import 'package:food_order_pj/carts/cart_product.dart';

//For using Globel /provider
class Cart extends ChangeNotifier {
  List<CartProduct> cartProduct = [];

  dynamic totalAmt = 0; //for total amount

  // For cart delete
  deleteProduct(CartProduct pro){
    this.cartProduct.forEach((element) {
      if(element.product.id == pro.product.id){

        totalAmt -= element.product.price * element.counter;
        this.cartProduct.remove(element);
        notifyListeners();
      }
    });
  }

  // For cart view list
  List<CartProduct> getList(){
    return this.cartProduct;
  }

  add(CartProduct cartPro) {
    this.cartProduct.add(cartPro);

    totalAmt += cartPro.counter * cartPro.product.price;
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
        totalAmt -= element.counter * element.product.price;
        totalAmt += pro.product.price * count;
        element.counter = count;

      }
    });
    notifyListeners();
  }
}
