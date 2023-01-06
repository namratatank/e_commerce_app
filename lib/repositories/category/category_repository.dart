import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/models/categories_model.dart';
import 'package:e_commerce_app/repositories/category/base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<CategoryModel>> getAllCategories() {
    return _firebaseFirestore.collection('categories').snapshots().map((event) {
      return event.docs.map((snap) => CategoryModel.fromSnapshot(snap)).toList();
    });
  }
}
