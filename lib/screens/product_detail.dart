import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/blocs/cart/cart_bloc.dart';
import 'package:e_commerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce_app/pages/cart_page.dart';
import 'package:e_commerce_app/widgets/carousel_img.dart';
import 'package:e_commerce_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/product_model.dart';
import '../pages/dashboard.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel productModel;
  final bool? isProductInWishlist;

  const ProductDetailScreen(
      {Key? key, required this.productModel, this.isProductInWishlist})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isAddToCart = false;
  bool isAddToWishlist = false;

  @override
  void initState() {
    isAddToCart = false;
    isAddToWishlist = widget.isProductInWishlist ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('product detail--------------------${widget.productModel}');

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.productModel.name,
        isProductInCart: isAddToCart,
        onBackPress: () {
          Navigator.pop(context);
          //  Navigator.push(
          //      context,
          //      MaterialPageRoute(
          //          builder: (builder) => Dashboard(
          //                index: 0,
          //                isProductInWishlist: isAddToWishlist,
          //              )));
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              BlocBuilder<WishListBloc, WishlistState>(
                builder: (BuildContext context, state) {
                  return IconButton(
                    onPressed: () {
                      isAddToWishlist
                          ? context.read<WishListBloc>().add(
                              RemoveProductFromWishlist(
                                  product: widget.productModel))
                          : context.read<WishListBloc>().add(
                              AddProductToWishlist(
                                  product: widget.productModel));
                      setState(() {
                        isAddToWishlist = !isAddToWishlist;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: isAddToWishlist
                              ? Text('Added to your wishlist')
                              : Text('Removed from your wishlist')));
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: isAddToWishlist ? Colors.red : Colors.white,
                    ),
                  );
                },
              ),
              BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                return ElevatedButton(
                    onPressed: () {
                      isAddToCart
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => Dashboard(
                                        index: 1,
                                      )))
                          : context.read<CartBloc>().add(
                              AddProductToCart(product: widget.productModel));
                      setState(() {
                        isAddToCart = true;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                          content: Text('Added to your cart'),
                           duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: isAddToCart
                        ? const Text(
                            'GO TO CART',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        : const Text(
                            'ADD TO CART',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ));
              })
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              CarouselSliderImg(
                productModel: widget.productModel,
              ),
            ],
            options: CarouselOptions(
                aspectRatio: 1.5,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                viewportFraction: 0.9),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Colors.black.withAlpha(50),
            child: Container(
              height: 50,
              color: Colors.black,
              margin: EdgeInsets.all(5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.productModel.name ?? '',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Text(
                      '\u{20B9} ${widget.productModel.price.toString()}',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                "Product Information",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              children: [
                ListTile(
                  title: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ExpansionTile(
              title: Text(
                "Delivery Information",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              children: [
                ListTile(
                  title: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
