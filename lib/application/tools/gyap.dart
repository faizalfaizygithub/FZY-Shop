import 'package:flutter/material.dart';

class Gyap extends StatelessWidget {
  double? height;
  double? width;
  Gyap({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
