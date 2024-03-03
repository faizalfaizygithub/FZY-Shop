import 'package:flutter/material.dart';
import 'package:mini_mall/application/tools/MyText.dart';

class MyPaymentMethodTile extends StatelessWidget {
  final String text;
  final String subtitle;
  final IconData icon;
  final Function() ontap;
  const MyPaymentMethodTile(
      {super.key,
      required this.text,
      required this.subtitle,
      required this.icon,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ontap,
        child: ListTile(
          tileColor: Theme.of(context).colorScheme.secondary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          leading: Icon(
            icon,
            color: Colors.grey.shade600,
          ),
          title: Text(
            text,
            style: titleHeadStyle,
          ),
          subtitle: Text(
            subtitle,
            style: smallTextStyle2,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}
