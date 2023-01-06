import 'package:e_commerce_app/blocs/cart/cart_bloc.dart';
import 'package:e_commerce_app/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/wishlist/wishlist_bloc.dart';
import '../models/product_model.dart';

class ProductCard extends StatefulWidget {
  final ProductModel productModel;
  final double widthFactor;
  final bool isWishlistPage;
  final double? leftPosition;
  final bool? isProductInWishlist;
  final bool? isProductInCart;

  const ProductCard({
    Key? key,
    required this.productModel,
    this.widthFactor = 2.5,
    this.isWishlistPage = false,
    this.leftPosition,
    this.isProductInWishlist,
    this.isProductInCart,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
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
                        if (widget.isWishlistPage) {
                          productInCart||widget.isProductInCart==true
                              ? context.read<CartBloc>().add(
                                  RemoveProductFromCart(
                                      product: widget.productModel))
                              : context.read<CartBloc>().add(AddProductToCart(
                                  product: widget.productModel));
                          setState(() {
                            productInCart = !productInCart;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: productInCart
                                  ? Text('Added to your cart')
                                  : Text('Removed from your wishlist')));
                        } else {
                          productInWishlist
                              ? context.read<WishListBloc>().add(
                                  RemoveProductFromWishlist(
                                      product: widget.productModel))
                              : context.read<WishListBloc>().add(
                                  AddProductToWishlist(
                                      product: widget.productModel));
                          setState(() {
                            productInWishlist = !productInWishlist;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: productInWishlist
                                  ? Text('Added to your wishlist')
                                  : Text('Removed from your wishlist')));
                        }
                      },
                      icon: productInWishlist ||
                              widget.isProductInWishlist == true
                          ? Icon(
                              widget.isWishlistPage
                                  ? Icons.shopping_cart
                                  : Icons.favorite,
                              color: widget.isWishlistPage
                                  ? Colors.green
                                  : Colors.red,
                            )
                          : Icon(
                              widget.isWishlistPage
                                  ? productInCart||widget.isProductInCart==true
                                      ? Icons.shopping_cart
                                      : Icons.add_circle
                                  : Icons.favorite_border,
                              color:
                                  productInCart||widget.isProductInCart==true ? Colors.green : Colors.white,
                            ),
                    ),
                  ),
                  widget.isWishlistPage
                      ? Expanded(
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
                        )
                      : SizedBox(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
