import 'package:flutter/material.dart';
import 'package:mini_mall/application/pages/cartPage.dart';
import 'package:mini_mall/application/pages/home_page.dart';
import 'package:mini_mall/application/pages/shop_page.dart';
import 'package:mini_mall/application/themes/light_mode.dart';
import 'package:mini_mall/data/cart_model.dart';
import 'package:mini_mall/domain/RazorPay_Payment/razor_pay.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          'homePage': (context) => const HomePage(),
          'shopPage': (context) => const ShopPage(),
          'cartPage': (context) => const CartPage(),
          'paymentPage': (context) => RazorPayPage(),
        },
        theme: lightMode,
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }
}
