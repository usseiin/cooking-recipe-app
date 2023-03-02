import 'dart:math';

import 'package:cooking_recipe_app/constants/route.dart';
import 'package:cooking_recipe_app/firebase_options.dart';
import 'package:cooking_recipe_app/screens/home/home_nav.dart';
import 'package:cooking_recipe_app/screens/home/start_learning.dart';
import 'package:cooking_recipe_app/screens/login_screen/signin.dart';
import 'package:cooking_recipe_app/screens/profile/profile_page.dart';
import 'package:cooking_recipe_app/screens/profile/profile_picture.dart';
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
      home:
          // Scaffold(
          //   body: SafeArea(
          //     child: Column(
          //       children: [
          //         Container(
          //           margin: const EdgeInsets.all(20),
          //           decoration: const BoxDecoration(
          //             borderRadius: BorderRadius.all(
          //               Radius.circular(20),
          //             ),
          //           ),
          //           width: double.infinity,
          //           height: 200,
          //           child: CustomPaint(
          //             painter: BarChart(values: values),
          //           ),
          //         ),
          //         Container(
          //           width: double.infinity,
          //           height: 300,
          //           color: Colors.yellow,
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          const Home(),
      routes: {
        loginSocialRoute: (context) => const LoginSocial(),
        startLearningRoute: (context) => const StartLearning(),
        navRoute: (context) => const RecipeHomeNav(),
        recipeHomeRoute: (context) => const RecipeHomeNav(),
        profilePicRoute: (context) => const ProfilePictureScreen(),
        profilePageRoute: (context) => const ProfilePage(),
        signInRoute: (context) => const SignInScreen(),
      },
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

class ConnectionError extends StatelessWidget {
  const ConnectionError({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Network Error..."),
      ),
    );
  }
}
