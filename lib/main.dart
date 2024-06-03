import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/app.dart';
import 'package:foodapp/core/services/database/database_service.dart';
import 'package:foodapp/core/services/network/api_service.dart';
import 'package:foodapp/screens/login_page.dart';
import 'package:foodapp/screens/product_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox('userBox');

  const apiKey = String.fromEnvironment('API_KEY');

  // Store the API key in SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('API_KEY', apiKey);

  isarService;
  apiService.initialize();

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      // User is not authenticated, navigate to the login screen
      runApp(const App(home: LoginPage()));
    } else {
      // User is authenticated, navigate to the home screen
      runApp(const App(home: ProductPage()));
    }
  });
}
