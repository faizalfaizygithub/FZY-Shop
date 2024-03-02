import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<dynamic> _shopItems = [
    // [itemName,itemPrize, description,imagePath , ]

    [
      'Adidas Tshirt',
      '1299.99',
      "Find your perfect men's t-shirt - from colourful pastels to iconic adidas designs,",
      'assets/tshirt.webp'
    ],
    [
      'Nike',
      ' 17949.99',
      'Nike Air technology consists of pressurised air inside a tough yet flexible bag, and provides more flexibility and spring without compromising structure',
      'assets/nike2.jpg'
    ],
    [
      'cr7 Watches',
      '29000.99',
      ' The Jacob & Co x CR7 Epic X collection is a profoundly personalized version of the Epic X.',
      'assets/cr.webp'
    ],
    [
      'Ray-Ban Glass',
      '19999.99',
      'Ray-Ban is a leader in sun and prescription eyewear for man or women',
      'assets/ryban.png'
    ]
  ];
  get shopItems => _shopItems;
// list of cart items
  final List _cartItems = [];
  get cartItems => _cartItems;

  //add to cart

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

// remove from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
// calculate total

  String calculateTotal() {
    double totalPrize = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrize += double.parse(_cartItems[i][1]);
    }
    return totalPrize.toStringAsFixed(2);
  }

  void addToCart() {}

  void removeFromCart() {}
}
