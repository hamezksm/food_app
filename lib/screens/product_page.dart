// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_app/core/services/database/database_service.dart';
import 'package:food_app/core/services/state/product_cart.dart';
import 'package:food_app/models/product.dart';
import 'package:food_app/screens/consent/app_bar.dart';
import 'package:food_app/screens/consent/colors.dart';
import 'package:food_app/screens/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int index = 0;
  List category = ['All'];
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      backgroundColor: background,
      appBar: appbar(cart, context),
      body: FutureBuilder<List<Product>>(
        future: isarService.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No products available'),
            );
          } else {
            final products = snapshot.data!;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Text(
                      'Popular category',
                      style: TextStyle(
                        fontSize: 20,
                        color: font,
                        fontFamily: 'ro',
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: ListView.builder(
                            itemCount: category.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      index = index;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: 5,
                                      bottom: 5,
                                      left: index == 0 ? 4 : 0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: index == index
                                          ? maincolor
                                          : Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: index == index
                                              ? maincolor
                                              : Colors.transparent,
                                          offset: index == index
                                              ? const Offset(1, 1)
                                              : const Offset(0, 0),
                                          blurRadius: index == index ? 7 : 0,
                                        )
                                      ],
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 17),
                                        child: Text(
                                          category[index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: index == index
                                                ? Colors.white
                                                : font,
                                            fontFamily: 'ro',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'All products',
                              style: TextStyle(
                                fontSize: 20,
                                color: font,
                                fontFamily: 'ro',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = products[index];
                        return ProductCard(product: product);
                      },
                      childCount: products.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 270,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

//return Container(
//   decoration: BoxDecoration(
//     color: Colors.white,
//     boxShadow: const [
//       BoxShadow(
//         color: Color.fromARGB(255, 185, 185, 185),
//         offset: Offset(1, 1),
//         blurRadius: 15,
//       ),
//     ],
//     borderRadius: BorderRadius.circular(20),
//   ),
//   child: Column(
//     children: [
//       const SizedBox(height: 10),
//       Padding(
//         padding: const EdgeInsets.only(right: 14),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 print('tapped');
//               },
//               child: const CartIconWithNumber(
//                   icon: Icons.shopping_cart_outlined,
//                   number: 1),
//             ),
//           ],
//         ),
//       ),
//       GestureDetector(
//         onTap: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//                 builder: (BuildContext context) =>
//                     ProductDetail(
//                       product: products[index],
//                     )),
//           );
//         },
//         child: Column(
//           children: [
//             // const SizedBox(height: 10),
//             // const Padding(
//             //   padding: EdgeInsets.only(right: 14),
//             //   child: Row(
//             //     mainAxisAlignment: MainAxisAlignment.end,
//             //     children: [
//             //       Icon(Icons.shopping_cart_outlined),
//             //     ],
//             //   ),
//             // ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 20,
//                 vertical: 15,
//               ),
//               child: Container(
//                 height: 110,
//                 width: 110,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: products[index].image != null
//                         ? NetworkImage(
//                             products[index].image!)
//                         : const AssetImage(
//                             'assets/images/image-not-found.png'),
//                     fit: BoxFit.cover,
//                   ),
//                   borderRadius:
//                       BorderRadius.circular(20),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               products[index].title != null
//                   ? products[index].title!
//                   : 'No name',
//               style: TextStyle(
//                 fontSize: 12,
//                 color: font,
//                 fontFamily: 'ro',
//               ),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment:
//                   MainAxisAlignment.spaceAround,
//               children: [
//                 Text(
//                   ' KES ${products[index].price?.toInt() ?? '0'}.00',
//                   style: const TextStyle(
//                     fontSize: 15,
//                     color: Colors.grey,
//                     fontFamily: 'ro',
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Icon(Icons.star,
//                         color: maincolor, size: 15),
//                     Text(
//                       '${products[index].likes ?? 0}',
//                       style: const TextStyle(
//                         fontSize: 15,
//                         color: Colors.grey,
//                         fontFamily: 'ro',
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     ],
//   ),
// );
