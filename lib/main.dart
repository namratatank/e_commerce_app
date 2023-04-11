import 'package:e_commerce_app/blocs/auth/auth_bloc.dart';
import 'package:e_commerce_app/blocs/cart/cart_bloc.dart';
import 'package:e_commerce_app/blocs/category/category_bloc.dart';
import 'package:e_commerce_app/blocs/checkout/checkout_bloc.dart';
import 'package:e_commerce_app/blocs/payment/payment_bloc.dart';
import 'package:e_commerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce_app/localstorage/local_storage_repository.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/pages/bottombar.dart';
import 'package:e_commerce_app/repositories/auth/auth_repository.dart';
import 'package:e_commerce_app/repositories/category/category_repository.dart';
import 'package:e_commerce_app/repositories/checkout/checkout_repository.dart';
import 'package:e_commerce_app/repositories/user/user_repository.dart';
import 'package:e_commerce_app/screens/splash.dart';
import 'package:e_commerce_app/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
                authRepository: context.read<AuthRepository>(),
                userRepository: context.read<UserRepository>()),
          ),
          BlocProvider(
            create: (_) =>
                WishListBloc(localStorageRepository: LocalStorageRepository())
                  ..add(StartWishlist()),
          ),
          BlocProvider(
            create: (_) => CartBloc()..add(CartStarted()),
          ),
          BlocProvider(
            create: (_) => PaymentBloc()..add(LoadPaymentMethod()),
          ),
          BlocProvider(
            create: (context) => CheckoutBloc(
                cartBloc: context.read<CartBloc>(),
                paymentBloc: context.read<PaymentBloc>(),
                checkoutRepository: CheckoutRepository()),
          ),

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
      ),
    );
  }
}
