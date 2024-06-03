// import 'package:flutter/material.dart';
// import 'package:foodapp/screens/consent/colors.dart';
// import 'package:foodapp/screens/consent/shopping_cart.dart';

// PreferredSizeWidget appbar() {
//   return AppBar(
//     automaticallyImplyLeading: false,
//     elevation: 0,
//     title: const Icon(
//       Icons.menu,
//       size: 27,
//     ),
//     actions: const [
//       Padding(
//           padding: EdgeInsets.only(right: 15),
//           child: CartIconWithNumber(icon: Icons.shopping_cart, number: 1)),
//     ],
//     backgroundColor: maincolor,
//   );
// }
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:foodapp/core/services/state/product_cart.dart';
import 'package:foodapp/screens/cart.dart';

PreferredSizeWidget appbar(Cart cart, BuildContext context) {
  return AppBar(
    title: const Text('Feast'),
    actions: [
      Observer(
        builder: (_) {
          // Unique product count
          // final uniqueProductCount = cart.uniqueProducts.length;
          final totalQuantity = cart.totalQuantity;

          return Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  );
                },
              ),
              if (totalQuantity > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '$totalQuantity',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    ],
  );
}
