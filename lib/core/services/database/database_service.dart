import 'dart:math';

import 'package:foodapp/core/services/network/api_service.dart';
import 'package:foodapp/models/product.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  static final IsarService _instance = IsarService._internal();
  late Future<Isar> db;

  factory IsarService() {
    return _instance;
  }

  IsarService._internal() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        [ProductSchema], // Add the schemas here
        directory: dir.path,
        inspector: true,
      );
      return isar;
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> saveProduct(Product product) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.products.put(product);
    });
  }

  Future<List<Product>> getProducts() async {
    final isar = await db;
    return isar.products.where().findAll();
  }

  Future<List<Product>> getAllProducts() async {
    final isar = await db;
    return await isar.products.where().findAll();
  }

  Future<void> generateRandomNumbersAndFetchProducts(int count) async {
    Random random = Random();
    List<int> numbers = [];

    for (int i = 0; i < count; i++) {
      int randomNumber = random.nextInt(60000) + 1;
      numbers.add(randomNumber);
    }

    await apiService.fetchProductsConcurrently(numbers);
  }
}

var isarService = IsarService();
