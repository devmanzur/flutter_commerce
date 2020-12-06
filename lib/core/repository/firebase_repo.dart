import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_commerce/core/models/product.dart';
import 'package:flutter_commerce/core/service/api.dart';
import 'package:flutter_commerce/locator.dart';

class FirebaseRepository extends ChangeNotifier{

  Api _api = locator<Api>();

  List<Product> products;


  Future<List<Product>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.docs
        .map((doc) => Product.fromMap(doc.data(), doc.id))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }
}