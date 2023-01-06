import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String? name;
  final String? category;
  final String? imageUrl;
  final double? price;
  final bool? isRecommended;
  final bool? isPopular;
   bool isItemInWishlist;

   ProductModel(
      {this.name,
      this.category,
      this.imageUrl,
      this.price,
      this.isRecommended,
      this.isPopular, this.isItemInWishlist = false});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular, isItemInWishlist];

  static ProductModel fromSnapshot(DocumentSnapshot snap) {
    ProductModel productModel = ProductModel(
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
        name: 'Soft drink 1',
        category: 'Soft drinks',
        imageUrl:
            'https://d1af89beukha9h.cloudfront.net/wp-content/uploads/2018/10/soft-drink-companies.jpg',
        price: 100,
        isRecommended: true,
        isPopular: false),
     ProductModel(
        name: 'Soft drink 2',
        category: 'Soft drinks',
        imageUrl:
            'https://d1af89beukha9h.cloudfront.net/wp-content/uploads/2018/10/soft-drink-companies.jpg',
        price: 125,
        isRecommended: true,
        isPopular: true),
     ProductModel(
        name: 'Soft drink 3',
        category: 'Soft drinks',
        imageUrl:
            'https://d1af89beukha9h.cloudfront.net/wp-content/uploads/2018/10/soft-drink-companies.jpg',
        price: 100,
        isRecommended: true,
        isPopular: false),
     ProductModel(
        name: 'Water 1',
        category: 'Water',
        imageUrl:
            'https://img.freepik.com/free-psd/plastic-water-bottle-mockup_439185-2468.jpg?w=2000',
        price: 250,
        isRecommended: false,
        isPopular: true),
     ProductModel(
        name: 'Water 2',
        category: 'Water',
        imageUrl:
            'https://img.freepik.com/free-psd/plastic-water-bottle-mockup_439185-2468.jpg?w=2000',
        price: 150,
        isRecommended: true,
        isPopular: true),
     ProductModel(
        name: 'Smoothies 1',
        category: 'Smoothies',
        imageUrl:
            'https://www.thereciperebel.com/wp-content/uploads/2022/04/how-to-make-a-smoothie-TRR-1200-32-of-34.jpg',
        price: 350,
        isRecommended: false,
        isPopular: true),
     ProductModel(
        name: 'Smoothies 2',
        category: 'Smoothies',
        imageUrl:
            'https://www.thereciperebel.com/wp-content/uploads/2022/04/how-to-make-a-smoothie-TRR-1200-32-of-34.jpg',
        price: 200,
        isRecommended: true,
        isPopular: false),
     ProductModel(
        name: 'Smoothies 3',
        category: 'Smoothies',
        imageUrl:
            'https://www.thereciperebel.com/wp-content/uploads/2022/04/how-to-make-a-smoothie-TRR-1200-32-of-34.jpg',
        price: 350,
        isRecommended: false,
        isPopular: true),
  ];
}
