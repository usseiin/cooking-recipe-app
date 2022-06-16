import 'package:cooking_recipe_app/constants/route.dart';
import 'package:cooking_recipe_app/screens/home/components/components.dart';
import 'package:cooking_recipe_app/screens/login_screen/component/components.dart';
import "package:flutter/material.dart";

class StartLearning extends StatelessWidget {
  const StartLearning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: "Food Recipes", icon: Icons.menu),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset("assets/images/Hero Image (1).png"),
      socialButton("Start learning", () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          recipeHomeRoute,
          (route) => false,
        );
      })
    ]);
  }
}
