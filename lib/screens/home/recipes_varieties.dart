import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/models/model.dart';
import 'package:cooking_recipe_app/models/responsive_size.dart';
import 'package:cooking_recipe_app/screens/home/components/components.dart';
import 'package:cooking_recipe_app/screens/home/recipes_details.dart';
import "package:flutter/material.dart";

class RecipesVarieties extends StatefulWidget {
  const RecipesVarieties({
    Key? key,
  }) : super(key: key);

  @override
  State<RecipesVarieties> createState() => _RecipesVarietiesState();
}

class _RecipesVarietiesState extends State<RecipesVarieties> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        text: "Recipes Varieties",
        icon: Icons.chevron_left,
        shadow: 4,
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: GridView.builder(
                  controller: scrollcontroller,
                  shrinkWrap: true,
                  itemCount: listOfProd.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: getProportionalScreenWidth(28),
                    childAspectRatio: 152 / 184,
                    mainAxisSpacing: getProportionalScreenHeigth(9),
                  ),
                  itemBuilder: (context, index) => ProdContainer(
                        recipe: listOfProd[index],
                      )),
            ),
            SizedBox(
              height: getProportionalScreenHeigth(50),
              width: double.infinity,
              child: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: getProportionalScreenHeigth(50),
                ),
                onPressed: () {
                  scrollcontroller.animateTo(
                    getProportionalScreenHeigth(400),
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
  const ProdContainer({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RecipesDetailScreen(
                recipe: recipe,
              ))),
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
            ]),
        child: Hero(
          tag: "${listOfProd.indexOf(recipe)}",
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
                    padding: EdgeInsets.only(
                      left: getProportionalScreenWidth(20),
                    ),
                    height: getProportionalScreenHeigth(52),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        bottomLeft:
                            Radius.circular(getProportionalScreenHeigth(12)),
                        bottomRight:
                            Radius.circular(getProportionalScreenHeigth(12)),
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      recipe.name,
                      style: prodCardTextStyle,
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
