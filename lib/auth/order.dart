import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_order_pj/models/product.dart';

class Order {
  Future<DocumentReference> createCustomer(String email) async {
    DocumentReference doc = await FirebaseFirestore.instance.collection('customers').add({
      "email": email
    });
    return doc;
  }

  void createOrder(int qty,Product product, String id){ //product => cart_product.dart
    FirebaseFirestore.instance.collection("orders").add({
      "name": product.name,
      "img": product.img,
      "price": product.price,
      "qty": qty,
      "customer_id": id
    });
  }

  Stream<QuerySnapshot> getCustomers() async* {
    Stream<QuerySnapshot> customers = FirebaseFirestore.instance.collection("customers").snapshots();
    yield* customers;
  }
}