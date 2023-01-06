import 'package:e_commerce_app/models/categories_model.dart';

abstract class BaseCategoryRepository {
  Stream<List<CategoryModel>> getAllCategories();
}