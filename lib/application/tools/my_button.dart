import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  Function() onTap;
  Widget? child;
  double? size;
  MyButton({super.key, required this.onTap, this.child, this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(size!),
        child: child,
      ),
    );
  }
}
