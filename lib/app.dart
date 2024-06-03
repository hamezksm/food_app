import 'package:flutter/material.dart';
import 'package:food_app/core/services/database/database_service.dart';
import 'package:food_app/core/services/state/product_cart.dart';
import 'package:food_app/models/product.dart';
import 'package:food_app/screens/product_page.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<Product> products = [];
  @override
  void initState() {
    super.initState();
    setup();
  }

  setup() async {
    await initializeApp();
  }

  Future<void> initializeApp() async {
    try {
      products = await isarService.getAllProducts();
      print("*************PRINTING PRODUCTS****************\n $products");
      if (products.isEmpty || products.length != 20) {
        await isarService.generateRandomNumbersAndFetchProducts(20);
      }
      return;
    } catch (e) {
      // Handle initialization error
      print('Initialization error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Cart>(create: (_) => Cart()),
      ],
      child: const MaterialApp(
        title: 'Feast',
        home: ProductPage(),
      ),
    );
  }
}