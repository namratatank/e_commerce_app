import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'product_model.g.dart';


@HiveType(typeId: 0)
class ProductModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? category;
  @HiveField(3)
  final String? imageUrl;
  @HiveField(4)
  final double? price;
  @HiveField(5)
  final bool? isRecommended;
  @HiveField(6)
  final bool? isPopular;
  @HiveField(7)
  bool isItemInWishlist;

  ProductModel(
      {required this.id,
      this.name,
      this.category,
      this.imageUrl,
      this.price,
      this.isRecommended,
      this.isPopular,
      this.isItemInWishlist = false});

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
        isItemInWishlist,
        id,
      ];

  static ProductModel fromSnapshot(DocumentSnapshot snap) {
    ProductModel productModel = ProductModel(
      id: snap.id,
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      isRecommended: snap['IsRecommended'],
      isPopular: snap['isPopular'],
    );
    return productModel;
  }

  static List<ProductModel> products = [
    ProductModel(
        id: '0',
        name: 'Soft drink 1',
        category: 'Soft drinks',
        imageUrl:
            'https://d1af89beukha9h.cloudfront.net/wp-content/uploads/2018/10/soft-drink-companies.jpg',
        price: 100,
        isRecommended: true,
        isPopular: false),
    ProductModel(
        id: '1',
        name: 'Soft drink 2',
        category: 'Soft drinks',
        imageUrl:
            'https://d1af89beukha9h.cloudfront.net/wp-content/uploads/2018/10/soft-drink-companies.jpg',
        price: 125,
        isRecommended: true,
        isPopular: true),
    ProductModel(
        id: '2',
        name: 'Soft drink 3',
        category: 'Soft drinks',
        imageUrl:
            'https://d1af89beukha9h.cloudfront.net/wp-content/uploads/2018/10/soft-drink-companies.jpg',
        price: 100,
        isRecommended: true,
        isPopular: false),
    ProductModel(
        id: '3',
        name: 'Water 1',
        category: 'Water',
        imageUrl:
            'https://img.freepik.com/free-psd/plastic-water-bottle-mockup_439185-2468.jpg?w=2000',
        price: 250,
        isRecommended: false,
        isPopular: true),
    ProductModel(
        id: '4',
        name: 'Water 2',
        category: 'Water',
        imageUrl:
            'https://img.freepik.com/free-psd/plastic-water-bottle-mockup_439185-2468.jpg?w=2000',
        price: 150,
        isRecommended: true,
        isPopular: true),
    ProductModel(
        id: '5',
        name: 'Smoothies 1',
        category: 'Smoothies',
        imageUrl:
            'https://www.thereciperebel.com/wp-content/uploads/2022/04/how-to-make-a-smoothie-TRR-1200-32-of-34.jpg',
        price: 350,
        isRecommended: false,
        isPopular: true),
    ProductModel(
        id: '6',
        name: 'Smoothies 2',
        category: 'Smoothies',
        imageUrl:
            'https://www.thereciperebel.com/wp-content/uploads/2022/04/how-to-make-a-smoothie-TRR-1200-32-of-34.jpg',
        price: 200,
        isRecommended: true,
        isPopular: false),
    ProductModel(
        id: '7',
        name: 'Smoothies 3',
        category: 'Smoothies',
        imageUrl:
            'https://www.thereciperebel.com/wp-content/uploads/2022/04/how-to-make-a-smoothie-TRR-1200-32-of-34.jpg',
        price: 350,
        isRecommended: false,
        isPopular: true),
  ];
}
