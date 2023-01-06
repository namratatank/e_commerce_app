import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/blocs/category/category_bloc.dart';
import 'package:e_commerce_app/models/categories_model.dart';
import 'package:e_commerce_app/models/models.dart';
import 'package:e_commerce_app/widgets/product_card.dart';
import 'package:e_commerce_app/widgets/product_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/carousel_img.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/section_title.dart';

class HomePage extends StatefulWidget {
 final bool? isProductInWishlist;
  const HomePage({Key? key, this.isProductInWishlist}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Foodie',
          isBackArrow: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
          options: CarouselOptions(
          autoPlay: true,
              aspectRatio: 1.5,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              viewportFraction: 0.9),
          items: CategoryModel.categories
              .map((category) => CarouselSliderImg(
            categoryModel: category,
          ))
              .toList(),
        ),
              // BlocBuilder<CategoryBloc, CategoryState>(
              //     builder: (context, state) {
              //   if (state is CategoryLoading) {
              //     return CircularProgressIndicator();
              //   }
              //   if (state is CategoryLoaded) {
              //     return CarouselSlider(
              //       options: CarouselOptions(
              //           autoPlay: true,
              //           aspectRatio: 1.5,
              //           enlargeCenterPage: true,
              //           enlargeStrategy: CenterPageEnlargeStrategy.height,
              //           viewportFraction: 0.9),
              //       items: state.categories
              //           .map((category) => CarouselSliderImg(
              //                 categoryModel: category,
              //               ))
              //           .toList(),
              //     );
              //   } else {
              //     return Text('Something went wrong');
              //   }
              // }),
              SectionTitle(title: 'Recommended'),
              ProductCarousel(
                products: ProductModel.products
                    .where((product) => product.isRecommended!)
                    .toList(),
                isProductInWishlist: widget.isProductInWishlist,
              ),
              SizedBox(height: 20),
              SectionTitle(title: 'Most Popular'),
              ProductCarousel(
                products: ProductModel.products
                    .where((product) => product.isPopular!)
                    .toList(),
                isProductInWishlist: widget.isProductInWishlist,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
