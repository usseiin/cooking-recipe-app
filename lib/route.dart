import 'package:cooking_recipe_app/models/model.dart';
import 'package:flutter/material.dart';

import 'screens/home/home_nav.dart';
import 'screens/home/recipes_details.dart';
import 'screens/home/start_learning.dart';
import 'screens/login_screen/signin.dart';
import 'screens/login_social.dart';
import 'screens/profile/profile_page.dart';
import 'screens/profile/profile_picture.dart';

Route generate(RouteSettings settings) {
  switch (settings.name) {
    case LoginSocial.route:
      return MaterialPageRoute(
        builder: (context) => const LoginSocial(),
      );
    case StartLearning.route:
      return MaterialPageRoute(
        builder: (context) => const StartLearning(),
      );
    case RecipeHomeNav.route:
      return MaterialPageRoute(
        builder: (context) => const RecipeHomeNav(),
      );
    case ProfilePictureScreen.route:
      return MaterialPageRoute(
        builder: (context) => const ProfilePictureScreen(),
      );
    case ProfilePage.route:
      return MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      );
    case SignInScreen.route:
      return MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      );
    case RecipesDetailScreen.route:
      final recipe = settings.arguments as Food;
      return MaterialPageRoute(
        builder: (context) => RecipesDetailScreen(recipe: recipe),
      );

    default:
      return MaterialPageRoute(
        builder: (context) {
          return MaterialApp(
            home: Scaffold(
              body: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Page doesn't exit"),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RecipeHomeNav.route);
                        },
                        child: const Text("Go to Home"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
  }
}
