import 'package:flutter/material.dart';


class SnakePixel extends StatelessWidget {
  const SnakePixel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(2.0),
        ),
      ),
    );
  }
}
