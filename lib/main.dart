import 'package:flutter/material.dart';
import 'package:mini_mall/application/pages/cartPage.dart';
import 'package:mini_mall/application/pages/home_page.dart';
import 'package:mini_mall/application/pages/payment_page.dart';
import 'package:mini_mall/application/pages/shop_page.dart';
import 'package:mini_mall/application/themes/light_mode.dart';
import 'package:mini_mall/data/cart_model.dart';
import 'package:mini_mall/domain/Credit_Card_Payment/credit_card_payment.dart';
import 'package:mini_mall/domain/UPI%20Payment/upi_india.dart';
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
          'paymentPage': (context) => const MyPaymentPage(),
          'UPIpage': (context) => const UPIPayment(),
          'creditcardPage': (context) => const CreditCardPayment()
        },
        theme: lightMode,
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }
}
