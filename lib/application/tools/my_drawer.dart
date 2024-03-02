import 'package:flutter/material.dart';
import 'package:mini_mall/application/tools/my_ListTile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(Icons.shopping_bag,
                    size: 90,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              MyListTile(
                ontap: () {
                  Navigator.pop(context);
                },
                txt: 'Shop',
                icon: Icons.home,
              ),
              MyListTile(
                ontap: () {
                  Navigator.pushReplacementNamed(context, 'cartPage');
                },
                txt: 'Cart',
                icon: Icons.shopping_cart,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MyListTile(
              ontap: () {
                Navigator.pushNamed(context, 'homePage');
              },
              txt: 'Exit',
              icon: Icons.exit_to_app,
            ),
          ),
        ],
      ),
    );
  }
}
