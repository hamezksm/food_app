import 'package:flutter/material.dart';
import 'package:food_app/models/product.dart';
import 'package:food_app/core/services/state/product_cart.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 185, 185, 185),
            offset: Offset(1, 1),
            blurRadius: 7,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Product image and other details
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: Container(
              height: 100,
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: product.image != null
                      ? NetworkImage(product.image!)
                      : const AssetImage('assets/images/image-not-found.png'),
                  fit: BoxFit.cover,
                  onError: (Object exception, StackTrace? stackTrace) =>
                      Image.asset(
                    'assets/images/image-not-found.png',
                    fit: BoxFit.cover,
                  ),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Text(
            product.title ?? 'No title',
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$${product.price?.toInt()}',
                style: const TextStyle(fontSize: 14, fontFamily: 'ro'),
              ),
              Observer(
                builder: (context) {
                  final quantity = cart.getProductQuantity(product);
                  return Column(
                    children: [
                      quantity > 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () => cart.removeProduct(product),
                                ),
                                Text('$quantity'),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () => cart.addProduct(product),
                                ),
                              ],
                            )
                          : ElevatedButton(
                              onPressed: () => cart.addProduct(product),
                              child: const Text('Add to Cart'),
                            ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
