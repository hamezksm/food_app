// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/screens/product_page.dart';
import 'package:hive/hive.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'REGISTER',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              obscureText: _obscureText,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Sign Up'),
              onPressed: () async {
                String email = _emailController.text;
                String password = _passwordController.text;
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  Box userBox = Hive.box('userBox');
                  userBox.put('email', email);

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductPage()));
                } catch (e) {
                  log('Sign-up failed: $e');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
