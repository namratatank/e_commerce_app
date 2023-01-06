import 'package:e_commerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/screens/product_detail.dart';
import 'package:e_commerce_app/widgets/wishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/wishlist_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/product_card.dart';

class WishlistScreen extends StatefulWidget {
  final ProductModel? productModel;
  final bool? isProductInCart;
  const WishlistScreen({Key? key, this.isProductInCart, this.productModel}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Wishlist',
        isWishlistPage: true,
        onBackPress: (){
          Navigator.pop(context);
        //  Navigator.push(context, MaterialPageRoute(builder: (builder)=>ProductDetailScreen(productModel: widget.productModel!)));
        },
      ),
      body: BlocBuilder<WishListBloc, WishlistState>(
        builder: (BuildContext context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } if (state is WishlistLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 2.3),
              itemCount: state.wishListModel.products.length,
              itemBuilder: (context, index) {
                print('wishlist products--------------------${state.wishListModel.products.length}');
               return Center(
                  child: WishlistCard(
                    productModel: state.wishListModel.products[index],
                    widthFactor: 1.1,
                    isWishlistPage: true,
                    leftPosition: 100,
                    isProductInCart: widget.isProductInCart,
                  ),
                );
              }
            );
          } else {
            return Center(child: const Text('Something went wrong'));
          }
        },
      ) ,
    );
  }
}
