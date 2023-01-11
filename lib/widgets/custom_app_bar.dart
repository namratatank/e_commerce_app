import 'package:e_commerce_app/screens/wishlist.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  bool? isBackArrow;
  bool? isWishlistPage;
  void Function()? onBackPress;
  bool? isProductInCart;
  Color backArrowColor;
  Color favoriteIconColor;

  CustomAppBar({
    Key? key,
    this.title,
    this.isBackArrow = true,
    this.isWishlistPage = false,
    this.onBackPress,
    this.isProductInCart,
    this.backArrowColor= Colors.black,
    this.favoriteIconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: isBackArrow == true
          ? IconButton(
              onPressed: onBackPress,
              icon: Icon(
                Icons.arrow_back_ios,
                color: backArrowColor,
              ))
          : SizedBox(),
      title: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          title ?? '',
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        isWishlistPage == false
            ? IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => WishlistScreen(isProductInCart: isProductInCart,)));
                },
                icon: Icon(
                  Icons.favorite,
                  color: favoriteIconColor,
                ),
              )
            : SizedBox()
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
