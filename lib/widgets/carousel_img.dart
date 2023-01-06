import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/screens/catalog.dart';
import 'package:flutter/material.dart';

import '../models/categories_model.dart';

class CarouselSliderImg extends StatelessWidget {
  final CategoryModel? categoryModel;
  final ProductModel? productModel;

  const CarouselSliderImg({Key? key, this.categoryModel, this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(productModel==null){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) =>
                      CatalogScreen(categoryModel: categoryModel!)));
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(productModel==null?categoryModel?.imageUrl??'':productModel?.imageUrl ?? '',
                    fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                     productModel==null? categoryModel?.name ?? '': productModel?.name??'',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
