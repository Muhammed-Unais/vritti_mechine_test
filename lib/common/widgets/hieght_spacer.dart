import 'package:flutter/material.dart';

class HightSpacer extends StatelessWidget {
  const HightSpacer({super.key, required this.hieght});

  final double hieght;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: hieght,
    );
  }
}