import 'package:e_commerce_app/blocs/cart/cart_bloc.dart';
import 'package:e_commerce_app/blocs/category/category_bloc.dart';
import 'package:e_commerce_app/blocs/checkout/checkout_bloc.dart';
import 'package:e_commerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce_app/pages/dashboard.dart';
import 'package:e_commerce_app/repositories/category/category_repository.dart';
import 'package:e_commerce_app/repositories/checkout/checkout_repository.dart';
import 'package:e_commerce_app/screens/splash.dart';
import 'package:e_commerce_app/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (_) => WishListBloc()..add(StartWishlist()),
        ),
        BlocProvider(
          create: (_) => CartBloc()..add(CartStarted()),
        ),
        BlocProvider(
            create: (context) => CheckoutBloc(
                cartBloc: context.read<CartBloc>(),
                checkoutRepository: CheckoutRepository())),
        // BlocProvider(
        //   create: (_) => CategoryBloc(
        //     categoryRepository: CategoryRepository(),
        //   )..add(LoadCategories()),
        // ),
      ],
      child: const MaterialApp(
        title: 'E-Commerce',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}