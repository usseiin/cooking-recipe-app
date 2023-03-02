import 'dart:math';

import 'package:cooking_recipe_app/firebase_options.dart';
import 'package:cooking_recipe_app/route.dart';
import 'package:cooking_recipe_app/screens/home/home_nav.dart';
import 'package:cooking_recipe_app/screens/login_social.dart';
import 'package:cooking_recipe_app/services/auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final values = List.generate(30, (index) => Random().nextDouble() * 100);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      onGenerateRoute: (settings) => generate(settings),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService().currentUser();
            if (user != null) {
              return const RecipeHomeNav();
            }
            return const LoginSocial();
          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
