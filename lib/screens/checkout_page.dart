// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:foodapp/core/services/state/product_cart.dart';
import 'package:foodapp/screens/success_page.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  Future<void> _completeCheckout(
      BuildContext context, double totalAmount) async {
    final response = await Dio().post(
      'https://jsonplaceholder.typicode.com/posts',
      data: {'total': totalAmount.toString()},
    );

    if (response.statusCode == 201) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SuccessPage()),
      );
    } else {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Checkout failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Observer(
        builder: (_) {
          final totalAmount = cart.totalAmount;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () => _completeCheckout(context, totalAmount),
                    child: const Text('Checkout'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
