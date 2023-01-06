import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/repositories/product/base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<ProductModel>> getAllProducts() {
    return _firebaseFirestore.collection('products').snapshots().map((event) {
      return event.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    });
  }
}
