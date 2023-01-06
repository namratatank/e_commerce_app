import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String? name;
  final String? imageUrl;

  const CategoryModel({this.name, this.imageUrl});

  @override
  // TODO: implement props
  List<Object?> get props => [name, imageUrl];

  static CategoryModel fromSnapshot(DocumentSnapshot snap) {
    CategoryModel categoryModel = CategoryModel(
      name: snap.get('name'),
      imageUrl: snap.get('imageUrl'),
    );
    return categoryModel;
  }

  static List<CategoryModel> categories = [
    const CategoryModel(
        name: 'Soft drinks',
        imageUrl:
            'https://d1af89beukha9h.cloudfront.net/wp-content/uploads/2018/10/soft-drink-companies.jpg'),
    const CategoryModel(
        name: 'Smoothies',
        imageUrl:
            'https://www.thereciperebel.com/wp-content/uploads/2022/04/how-to-make-a-smoothie-TRR-1200-32-of-34.jpg'),
    const CategoryModel(
        name: 'Water',
        imageUrl:
            'https://img.freepik.com/free-psd/plastic-water-bottle-mockup_439185-2468.jpg?w=2000')
  ];
}
