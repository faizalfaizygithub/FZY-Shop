import 'package:flutter/material.dart';
import 'package:mini_mall/application/tools/MyText.dart';
import 'package:mini_mall/application/tools/my_drawer.dart';
import 'package:mini_mall/application/tools/my_product_tile.dart';
import 'package:mini_mall/data/cart_model.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          'Shop Page',
          style: subHeadingStyle,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'cartPage');
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Pick from a selected list of premium product',
            style: titleHeadStyle,
          ),
          SizedBox(
            height: 720,
            child: Consumer<CartModel>(builder: (context, value, child) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.shopItems.length,
                itemBuilder: (context, index) {
                  return MyProductTile(
                    name: value.shopItems[index][0],
                    prices: value.shopItems[index][1],
                    discription: value.shopItems[index][2],
                    imagePath: value.shopItems[index][3],
                    ontap: () {
                      addToCart(context);
                      Provider.of<CartModel>(context, listen: false)
                          .addItemToCart(index);
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  void addToCart(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text('Add this item to your Cart?'),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('NO'),
                ),
                MaterialButton(
                  onPressed: () {
                    context.read<CartModel>().addToCart();
                    Navigator.pop(context);
                  },
                  child: const Text('YES'),
                )
              ],
            ));
  }
}
