import 'package:e_commerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

class WishListModel extends Equatable{
  final List<ProductModel> products;
 const WishListModel({this.products = const <ProductModel>[]});
  @override
  // TODO: implement props
  List<Object?> get props => [products];

}