import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {super.key, required this.colour, required this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 200.0,
        width: 170.0,
        child: cardChild,
      ),
    );
  }
}
