import 'package:e_commerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

class CartModel extends Equatable {
  final List<ProductModel> products;
  const CartModel({this.products= const <ProductModel>[]});

  @override
  // TODO: implement props
  List<Object?> get props => [products];

  Map productQuantity(product){
    var quantity = Map();
    product.forEach((element) {
      if(!quantity.containsKey(element)){
        quantity[element]=1;
      }else{
        quantity[element]+=1;
      }
    });
    return quantity;
  }

  double get subTotal => products.fold(
      0.0,
      (previousValue, element) =>
          previousValue + double.parse(element.price.toString()));

  double total(subTotal, deliveryFee) {
    return subTotal + deliveryFee(subTotal);
  }

  double deliveryFee(subTotal) {
    if (subTotal >= 500) {
      return 0.0;
    } else {
      return 99;
    }
  }

  String freeDelivery(subTotal) {
    if (subTotal >= 500) {
      return 'You have free delivery';
    } else {
      return 'Add \u{20B9} ${500 - subTotal} more for free delivery';
    }
  }

  String get subTotalString => subTotal.toStringAsFixed(2);

  String get totalString => total(subTotal, deliveryFee).toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subTotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subTotal);

}
