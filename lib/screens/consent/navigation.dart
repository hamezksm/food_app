import 'package:flutter/material.dart';
import 'package:food_app/core/services/database/database_service.dart';
import 'package:food_app/screens/cart.dart';
import 'package:food_app/screens/consent/colors.dart';
import 'package:food_app/screens/product_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  getProducts() async {
    return await isarService.getAllProducts();
  }

  int index = 0;
  List screen = [const ProductPage(), CartPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            index = 2;
          });
        },
        backgroundColor: maincolor,
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 27,
                  color: index == 0 ? maincolor : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Icon(
                  Icons.category,
                  size: 27,
                  color: index == 1 ? maincolor : Colors.grey,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 3;
                  });
                },
                child: Icon(
                  Icons.favorite,
                  size: 27,
                  color: index == 3 ? maincolor : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 4;
                  });
                },
                child: Icon(
                  Icons.person,
                  size: 27,
                  color: index == 4 ? maincolor : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: screen[index],
    );
  }
}
