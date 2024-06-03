import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:foodapp/core/constants/api.dart';
import 'package:foodapp/core/services/database/database_service.dart';
import 'package:foodapp/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static Dio? dio;
  static bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? apiKey = prefs.getString('API_KEY');

    if (apiKey != null) {
      dio = Dio(
        BaseOptions(
          baseUrl: Api.apiUrl,
          headers: {'x-api-key': apiKey},
        ),
      );
      _isInitialized = true;
      log('ApiService initialized successfully');
    } else {
      throw Exception('API Key not found');
    }
  }

  bool get isInitialized => _isInitialized;

  Future<void> fetchProduct(int id) async {
    if (!_isInitialized) {
      throw StateError(
          'ApiService is not initialized. Call initialize() first.');
    }

    try {
      final response = await dio!.get('/food/products/$id');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        final product = Product.fromJson(data);
        await isarService.saveProduct(product);
      } else {
        throw Exception(
            'Status Code: ${response.statusCode}. Failed to load product');
      }
    } catch (e) {
      throw Exception('Failed to load product: $e');
    }
  }

  Future<void> fetchProductsConcurrently(List<int> ids) async {
    if (!_isInitialized) {
      throw StateError(
          'ApiService is not initialized. Call initialize() first.');
    }

    final List<Future<void>> fetchTasks =
        ids.map((id) => fetchProduct(id)).toList();
    await Future.wait(fetchTasks);
  }
}

var apiService = ApiService();
