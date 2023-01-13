

import 'package:hive_flutter/hive_flutter.dart';

import '../models/product_model.dart';

abstract class BaseLocalStorageRepository{
  Future<Box> openBox();
  List<ProductModel> getWishlist(Box box);
  Future<void> addProductToWishlist(Box box, ProductModel productModel);
  Future<void> removeProductFromWishlist(Box box, ProductModel productModel);
  Future<void> clearWishlist(Box box);
}