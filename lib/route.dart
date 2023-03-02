import 'package:flutter/material.dart';

import 'screens/home/home_nav.dart';
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

    default:
      return MaterialPageRoute(
        builder: (_) {
          return const MaterialApp(
            home: Scaffold(
              body: Text("Page doesn't exit"),
            ),
          );
        },
      );
  }
}
