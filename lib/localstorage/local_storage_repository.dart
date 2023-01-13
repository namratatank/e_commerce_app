import 'package:e_commerce_app/localstorage/base_local_storage_repository.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:hive/hive.dart';

class LocalStorageRepository extends BaseLocalStorageRepository {
  String boxName = 'wishlist_products';
  @override
  Future<Box> openBox() async{
    Box box = await Hive.openBox<ProductModel>(boxName);
        return box;
  }

  @override
  List<ProductModel> getWishlist(Box box) {
  return box.values.toList() as List<ProductModel>;
  }

  @override
  Future<void> addProductToWishlist(Box box, ProductModel productModel) async{
    await box.put(productModel.id, productModel);
  }

  @override
  Future<void> removeProductFromWishlist(Box box, ProductModel productModel) async{
    await box.delete(productModel.id);
  }

  @override
  Future<void> clearWishlist(Box box) async{
    await box.clear();
  }
}
