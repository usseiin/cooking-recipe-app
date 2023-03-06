import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/utils/responsive_size.dart';
import 'package:cooking_recipe_app/screens/home/recipes_screen.dart';
import 'package:cooking_recipe_app/screens/home/start_learning.dart';
import 'package:cooking_recipe_app/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';

class RecipeHomeNav extends StatefulWidget {
  const RecipeHomeNav({
    Key? key,
  }) : super(key: key);

  static const String route = "/recipe_home_nav";

  @override
  State<RecipeHomeNav> createState() => _RecipeHomeNavState();
}

class _RecipeHomeNavState extends State<RecipeHomeNav> {
  int currentSelected = 0;
  List list = [
    const StartLearning(),
    const RecipesScreen(
      listType: ListType.normal,
    ),
    const RecipesScreen(
      listType: ListType.filtered,
    ),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(child: list[currentSelected]),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: getProportionalScreenHeigth(95),
          backgroundColor: Colors.transparent,
          indicatorColor: Colors.transparent,
        ),
        child: NavigationBar(
          onDestinationSelected: (value) {
            setState(() {
              currentSelected = value;
            });
          },
          selectedIndex: currentSelected,
          destinations: [
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home,
                color: black,
                size: getProportionalScreenHeigth(45),
              ),
              icon: Icon(
                Icons.home,
                color: iconGrey,
                size: getProportionalScreenHeigth(45),
              ),
              label: "",
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.bookmark,
                color: black,
                size: getProportionalScreenHeigth(45),
              ),
              icon: Icon(
                Icons.bookmark,
                color: iconGrey,
                size: getProportionalScreenHeigth(45),
              ),
              label: "",
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.favorite_outline,
                color: black,
                size: getProportionalScreenHeigth(45),
              ),
              icon: Icon(
                Icons.favorite_outline,
                color: iconGrey,
                size: getProportionalScreenHeigth(45),
              ),
              label: "",
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.person,
                color: black,
                size: getProportionalScreenHeigth(45),
              ),
              icon: Icon(
                Icons.person,
                color: iconGrey,
                size: getProportionalScreenHeigth(45),
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
