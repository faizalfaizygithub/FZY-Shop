import 'package:flutter/material.dart';
import 'package:mini_mall/application/tools/MyText.dart';
import 'package:mini_mall/application/tools/gyap.dart';
import 'package:mini_mall/application/tools/my_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.shopping_bag,
              size: 90, color: Theme.of(context).colorScheme.inversePrimary),
          Gyap(
            height: 20,
          ),
          Text(
            'FZY Shop',
            style: subHeadingStyle,
          ),
          Gyap(
            height: 10,
          ),
          Text('Premium Quality Products', style: titleHeadStyle),
          Gyap(
            height: 40,
          ),
          MyButton(
            onTap: () {
              Navigator.pushNamed(context, 'shopPage');
            },
            size: 25,
            child: const Icon(Icons.arrow_forward),
          ),
        ]),
      ),
    );
  }
}
