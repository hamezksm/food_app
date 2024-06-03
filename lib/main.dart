import 'package:flutter/material.dart';
import 'package:foodapp/app.dart';
import 'package:foodapp/core/services/database/database_service.dart';
import 'package:foodapp/core/services/network/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const apiKey = String.fromEnvironment('API_KEY');

  // Store the API key in SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('API_KEY', apiKey);

  isarService;
  apiService.initialize();

  runApp(const App());
}
