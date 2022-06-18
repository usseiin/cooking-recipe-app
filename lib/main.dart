import 'package:cooking_recipe_app/constants/route.dart';
import 'package:cooking_recipe_app/screens/home/home_nav.dart';
import 'package:cooking_recipe_app/screens/home/start_learning.dart';
import 'package:cooking_recipe_app/screens/login_screen/signin.dart';
import 'package:cooking_recipe_app/screens/profile/profile_page.dart';
import 'package:cooking_recipe_app/screens/profile/profile_picture.dart';
import 'package:cooking_recipe_app/screens/recipe_home/login_social.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginSocial(),
      routes: {
        loginSocialRoute: (context) => const LoginSocial(),
        startLearningRoute: (context) => const StartLearning(),
        navRoute: (context) => const RecipeHomeNav(),
        profilePicRoute: (context) => const ProfilePictureScreen(),
        profilePageRoute: (context) => const ProfilePage(),
        signInRoute: (context) => const SignInScreen(),
      },
    );
  }
}
