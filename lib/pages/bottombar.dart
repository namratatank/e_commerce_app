import 'package:e_commerce_app/pages/cart_page.dart';
import 'package:e_commerce_app/pages/home_page.dart';
import 'package:e_commerce_app/pages/profile_page.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  int? index;
  final bool? isProductInWishlist;

  Dashboard({Key? key, this.index, this.isProductInWishlist}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  late List screens;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = widget.index ?? 0;
    screens = [
      HomePage(
        isProductInWishlist: widget.isProductInWishlist,
      ),
      CartPage(),
      ProfilePage()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        )
        // BottomAppBar(
        //   child: Container(
        //     height: 70,
        //     color: Colors.black,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         IconButton(
        //           onPressed: () {
        //             Navigator.pushNamed(context, '/');
        //           },
        //           icon: const Icon(
        //             Icons.home,
        //             color: Colors.white,
        //           ),
        //         ),
        //         IconButton(
        //           onPressed: () {},
        //           icon: const Icon(
        //             Icons.shopping_cart,
        //             color: Colors.white,
        //           ),
        //         ),
        //         IconButton(
        //           onPressed: () {},
        //           icon: const Icon(
        //             Icons.person,
        //             color: Colors.white,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
