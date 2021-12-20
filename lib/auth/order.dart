import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  Future<DocumentReference> createCustomer(String email) async {
    DocumentReference doc = await FirebaseFirestore.instance.collection('customers').add({
      "email": email
    });
    return doc;
  }
}