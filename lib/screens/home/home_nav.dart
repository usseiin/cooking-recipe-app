import 'package:cooking_recipe_app/screens/home/recipes_varieties.dart';
import 'package:cooking_recipe_app/screens/home/start_learning.dart';
import 'package:cooking_recipe_app/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';

class RecipeHomeNav extends StatefulWidget {
  const RecipeHomeNav({Key? key}) : super(key: key);

  @override
  State<RecipeHomeNav> createState() => _RecipeHomeNavState();
}

class _RecipeHomeNavState extends State<RecipeHomeNav> {
  int currentSelected = 0;
  List list = const [
    StartLearning(),
    RecipesVarieties(),
    RecipesVarieties(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: list[currentSelected]),
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
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
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home,
              ),
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "",
            ),
            NavigationDestination(
                selectedIcon: Icon(
                  Icons.collections_bookmark,
                ),
                icon: Icon(
                  Icons.collections_bookmark_outlined,
                ),
                label: ""),
            NavigationDestination(
                selectedIcon: Icon(
                  Icons.favorite,
                ),
                icon: Icon(
                  Icons.favorite_outline,
                ),
                label: ""),
            NavigationDestination(
                selectedIcon: Icon(
                  Icons.person,
                ),
                icon: Icon(
                  Icons.person_outlined,
                ),
                label: "")
          ],
        ),
      ),
    );
  }
}
