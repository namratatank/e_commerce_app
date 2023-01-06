import 'package:e_commerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

class CheckoutModel extends Equatable {
  final String? name;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final List<ProductModel>? products;
  final String? deliveryFee;
  final String? subTotal;
  final String? total;

  const CheckoutModel({
    this.name,
    this.email,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.products,
    this.deliveryFee,
    this.subTotal,
    this.total,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        address,
        city,
        country,
        zipCode,
        products,
        deliveryFee,
        subTotal,
        total,
      ];

  Map<String, Object> toDocument() {
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipCode'] = zipCode;

    return {
      'customerAddress': customerAddress,
      'customerName': name!,
      'customerEmail': email!,
      'products': products!.map((item) => item.name).toList(),
      'subTotal': subTotal!,
      'deliveryFee': deliveryFee!,
      'total': total!
    };
  }
}
