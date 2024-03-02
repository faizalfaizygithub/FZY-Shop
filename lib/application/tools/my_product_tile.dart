import 'package:flutter/material.dart';
import 'package:mini_mall/application/tools/MyText.dart';
import 'package:mini_mall/application/tools/gyap.dart';
import 'package:mini_mall/application/tools/my_button.dart';

class MyProductTile extends StatelessWidget {
  final String name;
  final String prices;
  final String discription;
  final String imagePath;
  final Function() ontap;
  const MyProductTile({
    super.key,
    required this.name,
    required this.prices,
    required this.discription,
    required this.imagePath,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primary,
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //product image
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Gyap(
                height: 10,
              ),
              //product Name
              Text(
                name,
                style: productHeadStyle,
              ),
              Gyap(
                height: 20,
              ),

              //product description

              Text(
                discription,
                style: smallTextStyle,
              ),

              Gyap(
                height: 20,
              ),
            ],
          ),
          //product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('₹' + prices),
              MyButton(
                onTap: ontap,
                size: 15,
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
