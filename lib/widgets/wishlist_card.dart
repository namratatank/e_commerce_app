import 'package:e_commerce_app/blocs/cart/cart_bloc.dart';
import 'package:e_commerce_app/pages/dashboard.dart';
import 'package:e_commerce_app/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/wishlist/wishlist_bloc.dart';
import '../models/product_model.dart';

class WishlistCard extends StatefulWidget {
  final ProductModel productModel;
  final double widthFactor;
  final bool isWishlistPage;
  final double? leftPosition;
  final bool? isProductInWishlist;
  final bool? isProductInCart;

  const WishlistCard({
    Key? key,
    required this.productModel,
    this.widthFactor = 2.5,
    this.isWishlistPage = false,
    this.leftPosition,
    this.isProductInWishlist,
    this.isProductInCart,
  }) : super(key: key);

  @override
  State<WishlistCard> createState() => _WishlistCardState();
}

class _WishlistCardState extends State<WishlistCard> {
  bool productInWishlist = false;
  bool productInCart = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => ProductDetailScreen(
                      productModel: widget.productModel,
                      isProductInWishlist: productInWishlist,
                    )));
      },
      child: Stack(
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width / widget.widthFactor,
            child: Image.network(
              widget.productModel.imageUrl ?? '',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 95,
            left: widget.leftPosition,
            right: 8,
            child: Container(
              color: Colors.black.withOpacity(0.7),
              width: MediaQuery.of(context).size.width / widget.widthFactor,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productModel.name ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '\u{20B9} ${widget.productModel.price}'.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        productInCart || widget.isProductInCart == true
                            ? context.read<CartBloc>().add(
                                RemoveProductFromCart(
                                    product: widget.productModel))
                            : context.read<CartBloc>().add(
                                AddProductToCart(product: widget.productModel));
                        setState(() {
                          productInCart = !productInCart;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: productInCart
                                ? Text('Added to your cart')
                                : Text('Removed from your cart'),
                            action: SnackBarAction(
                                label: 'Go to cart',
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => Dashboard(
                                                index: 1,
                                              )));
                                }),
                          ),
                        );
                      },
                      icon: Icon(
                        productInCart || widget.isProductInCart == true
                            ? Icons.shopping_cart
                            : Icons.add_circle,
                        color: productInCart || widget.isProductInCart == true
                            ? Colors.green
                            : Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        context.read<WishListBloc>().add(
                            RemoveProductFromWishlist(
                                product: widget.productModel));
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
