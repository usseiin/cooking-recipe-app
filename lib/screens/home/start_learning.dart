import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/constants/route.dart';
import 'package:cooking_recipe_app/models/responsive_size.dart';
import 'package:cooking_recipe_app/screens/home/components/components.dart';
import 'package:cooking_recipe_app/screens/login_screen/component/components.dart';
import "package:flutter/material.dart";

class StartLearning extends StatelessWidget {
  const StartLearning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(
        text: "Food Recipes",
        icon: Icons.chevron_left,
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: getProportionalScreenHeigth(350),
          width: getProportionalScreenWidth(414),
          child: Image.asset(
            "assets/images/Hero Image (1).png",
            fit: BoxFit.fitHeight,
          )),
      height(getProportionalScreenHeigth(163)),
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionalScreenWidth(62)),
        child: socialButton("Start learning", () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            recipeHomeRoute,
            (route) => false,
          );
        }),
      )
    ]);
  }
}
