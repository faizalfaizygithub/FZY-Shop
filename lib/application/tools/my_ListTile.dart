import 'package:flutter/material.dart';
import 'package:mini_mall/application/tools/MyText.dart';

class MyListTile extends StatelessWidget {
  IconData? icon;
  String txt;
  void Function() ontap;
  MyListTile({super.key, required this.ontap, required this.txt, this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.grey.shade600,
      ),
      title: Text(
        txt,
        style: smallTextStyle,
      ),
      onTap: ontap,
    );
  }
}
