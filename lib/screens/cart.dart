import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_app/core/services/state/product_cart.dart';
import 'package:food_app/screens/checkout_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    bool canCheckout = cart.products.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Observer(
        builder: (_) {
          final uniqueProducts = cart.uniqueProducts;
          if (uniqueProducts.isEmpty) {
            return const Center(child: Text('Your cart is empty'));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: uniqueProducts.length,
                  itemBuilder: (context, index) {
                    final product = uniqueProducts[index];
                    final quantity = cart.getProductQuantity(product);
                    final totalProductAmount = product.price ?? 0 * quantity;

                    return ListTile(
                      leading: product.image != null
                          ? Image.network(
                              product.image!,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Image.asset(
                                  'assets/images/image-not-found.png',
                                  height: 50.0,
                                );
                              },
                            )
                          : Image.asset(
                              'assets/images/image-not-found.png'), // Assuming product has an image URL
                      title: Text(product.title ?? 'No title'),
                      subtitle: Text(
                          'Quantity: $quantity\nTotal: \$${totalProductAmount.toStringAsFixed(2)}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => cart.removeProduct(product),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => cart.addProduct(product),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Observer(
                  builder: (_) {
                    final totalAmount = cart.totalAmount;
                    return Text(
                      'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ),
              canCheckout
                  ? ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.resolveWith<Color?>(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.pressed)) {
                              return Colors.blue;
                            } else if (states.contains(WidgetState.hovered)) {
                              return Colors.green;
                            } else if (states.contains(WidgetState.disabled)) {
                              return Colors.grey;
                            }
                            return Colors
                                .grey.shade300; // Use the default color
                          },
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CheckoutPage(),
                          ),
                        );
                      },
                      child: Container(
                        // height: 30.0,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 60.0),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    )
                  : Container(),
              const SizedBox(height: 10.0),
            ],
          );
        },
      ),
    );
  }
}
