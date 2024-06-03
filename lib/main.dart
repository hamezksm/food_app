import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodapp/app.dart';
import 'package:foodapp/core/services/database/database_service.dart';
import 'package:foodapp/core/services/network/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const bool isProduction = bool.fromEnvironment('dart.vm.product');
  if (!isProduction) {
    await dotenv.load(fileName: '.env');
  }

  final apiKey = isProduction
      ? const String.fromEnvironment('API_KEY')
      : dotenv.env['API_KEY']!;

  if (apiKey.isEmpty) {
    log('API key not found!');
  } else {
    // Store the API key in SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('API_KEY', apiKey);
  }

  isarService;
  apiService.initialize();

  runApp(const App());
}
