import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodapp/app.dart';
import 'package:foodapp/core/services/database/database_service.dart';
import 'package:foodapp/core/services/network/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  final String apiKey = dotenv.env['API_KEY']!;

  // Store the API key in SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('API_KEY', apiKey);

  isarService;
  apiService.initialize();

  runApp(const App());
}
