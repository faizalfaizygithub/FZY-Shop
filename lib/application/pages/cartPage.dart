import 'package:flutter/material.dart';
import 'package:mini_mall/application/tools/MyText.dart';
import 'package:mini_mall/application/tools/gyap.dart';
import 'package:mini_mall/application/tools/my_button.dart';
import 'package:mini_mall/data/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
// remove item from cart
  void removeFromCart(BuildContext context, index) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text('Remove this item from Cart?'),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('NO'),
                ),
                MaterialButton(
                  onPressed: () {
                    context.read<CartModel>().removeFromCart();
                    Navigator.pop(context);
                  },
                  child: const Text('YES'),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Cart',
                    style: subHeadingStyle,
                  ),
                  Gyap(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: value.cartItems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ListTile(
                              tileColor:
                                  Theme.of(context).colorScheme.secondary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              leading: Image.asset(
                                value.cartItems[index][3],
                                height: 45,
                              ),
                              title: Text(
                                value.cartItems[index][0],
                                style: smallTextStyle,
                              ),
                              subtitle: Text('₹ ' + value.cartItems[index][1]),
                              trailing: IconButton(
                                  onPressed: () {
                                    Provider.of<CartModel>(context,
                                            listen: false)
                                        .removeItemFromCart(index);
                                    removeFromCart(context, index);
                                  },
                                  icon: const Icon(Icons.cancel)),
                            ),
                          );
                        }),
                  ),
                  Container(
                    height: 98,
                    width: 340,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).colorScheme.inversePrimary),
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Prices',
                                style: cartstyle2,
                              ),
                              Text('₹ ' + value.calculateTotal(),
                                  style: cartstyl),
                            ],
                          ),
                        ),
                        MyButton(
                          onTap: () {},
                          size: 1,
                          child: Text(
                            'Pay Now',
                            style: smallTextStyle,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
