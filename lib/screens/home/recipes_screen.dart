import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/models/model.dart';
import 'package:cooking_recipe_app/services/recipe_service.dart';
import 'package:cooking_recipe_app/utils/responsive_size.dart';
import 'package:cooking_recipe_app/screens/home/components/components.dart';
import 'package:cooking_recipe_app/screens/home/recipes_details.dart';
import "package:flutter/material.dart";

enum ListType { filtered, normal }

class RecipesScreen extends StatelessWidget {
  final ListType listType;
  const RecipesScreen({
    Key? key,
    required this.listType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        text: listType == ListType.filtered
            ? "Favorite Recipes"
            : "Recipes Varieties",
        shadow: 4,
      ),
      body: Body(
        listType: listType,
      ),
    );
  }
}

class Body extends StatefulWidget {
  final ListType listType;
  const Body({Key? key, required this.listType}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void callback(String recipeName) {
    RecipeService().toggleFavorite(recipeName);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double currentPageLength = 0;
    ScrollController scrollcontroller = ScrollController();
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          top: getProportionalScreenHeigth(49),
          right: getProportionalScreenWidth(42),
          left: getProportionalScreenWidth(42),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: widget.listType == ListType.filtered
                  ? RecipeService().favoriteRecipes
                  : RecipeService().fetchFoods,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var recipes = snapshot.data as List<Food>;
                  return Expanded(
                    child: GridView.builder(
                      controller: scrollcontroller,
                      shrinkWrap: true,
                      itemCount: recipes.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: getProportionalScreenWidth(28),
                        childAspectRatio: 152 / 184,
                        mainAxisSpacing: getProportionalScreenHeigth(9),
                      ),
                      itemBuilder: (context, index) => ProdContainer(
                        recipe: recipes[index],
                        callback: () => callback(recipes[index].name),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            SizedBox(
              height: getProportionalScreenHeigth(40),
              child: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: getProportionalScreenHeigth(50),
                ),
                onPressed: () {
                  currentPageLength += getProportionalScreenHeigth(400);
                  final scrollPosition = scrollcontroller.position;
                  if (scrollPosition.atEdge) {
                    if (scrollPosition.pixels != 0) {
                      currentPageLength = 0;
                    }
                  }
                  scrollcontroller.animateTo(
                    currentPageLength,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProdContainer extends StatelessWidget {
  final Food recipe;
  final VoidCallback callback;
  const ProdContainer({
    Key? key,
    required this.recipe,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RecipesDetailScreen.route,
          arguments: recipe),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 184, maxWidth: 152),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: lightBlack,
              offset: Offset(0, 3),
              blurRadius: 2,
            )
          ],
        ),
        child: Hero(
          tag: "${foods.indexOf(recipe)}",
          child: Stack(
            children: [
              Image.asset(
                recipe.smallImage,
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionalScreenWidth(16),
                    ),
                    height: getProportionalScreenHeigth(52),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        bottomLeft:
                            Radius.circular(getProportionalScreenHeigth(20)),
                        bottomRight:
                            Radius.circular(getProportionalScreenHeigth(20)),
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          recipe.name,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: prodCardTextStyle,
                        ),
                        GestureDetector(
                          onTap: callback,
                          child: recipe.fav
                              ? const Icon(
                                  Icons.favorite,
                                  size: 20,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_outline,
                                  size: 20,
                                ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
