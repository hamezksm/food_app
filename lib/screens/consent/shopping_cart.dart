import 'package:flutter/material.dart';

class CartIconWithNumber extends StatelessWidget {
  final IconData icon;
  final int number;

  const CartIconWithNumber(
      {super.key, required this.icon, required this.number});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Icon(
          icon,
          size: 30.0,
        ),
        if (number > 0)
          Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 15,
                minHeight: 15,
              ),
              child: Text(
                '$number',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 6,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
