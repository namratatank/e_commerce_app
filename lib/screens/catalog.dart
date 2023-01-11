import 'package:e_commerce_app/models/categories_model.dart';
import 'package:e_commerce_app/models/models.dart';
import 'package:e_commerce_app/widgets/product_card.dart';
import 'package:e_commerce_app/widgets/product_carousel.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  final CategoryModel categoryModel;

  const CatalogScreen({Key? key, required this.categoryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductModel> categoryProduct = ProductModel.products.where((element) => element.category==categoryModel.name).toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: categoryModel.name,
        onBackPress: (){
          Navigator.pop(context);
        },
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1.15),
        itemCount: categoryProduct.length,
        itemBuilder: (context, index) => Center(
          child: ProductCard(
            productModel: categoryProduct[index],
            widthFactor: 2.2,
          ),
        ),
      ),
    );
  }
}
