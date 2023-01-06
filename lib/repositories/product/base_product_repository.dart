import 'package:e_commerce_app/models/product_model.dart';

abstract class BaseProductRepository {
  Stream<List<ProductModel>> getAllProducts();
}