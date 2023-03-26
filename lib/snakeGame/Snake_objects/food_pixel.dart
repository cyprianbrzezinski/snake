import 'package:flutter/material.dart';


class FoodPixel extends StatelessWidget {
  const FoodPixel ({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 72, 255, 0),
          borderRadius: BorderRadius.circular(2.0),
        ),
      ),
    );
  }
}
