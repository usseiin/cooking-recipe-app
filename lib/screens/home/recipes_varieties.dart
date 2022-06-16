import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/screens/home/components/components.dart';
import 'package:cooking_recipe_app/screens/home/recipes_details.dart';
import "package:flutter/material.dart";

class RecipesVarieties extends StatefulWidget {
  const RecipesVarieties({Key? key}) : super(key: key);

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
    List list = [
      {'text': "Homemade Pizza", 'image': "food.png"},
      {'text': "Italian Salad", 'image': "food1.png"},
      {'text': "French Toast", 'image': "food2.png"},
      {'text': "Croissant", 'image': "food3.png"},
      {'text': "American Pancake", 'image': "food31.png"},
      {'text': "Lasagna", 'image': "food4.png"},
    ];
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 49, right: 42, left: 42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    childAspectRatio: 152 / 184,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) => ProdContainer(
                        text: list[index]["text"],
                        image: list[index]["image"],
                      )),
            ),
            const SizedBox(
              height: 50,
              child: Icon(Icons.arrow_downward),
            )
          ],
        ),
      ),
    );
  }
}

class ProdContainer extends StatelessWidget {
  const ProdContainer({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const RecipesDetailScreen())),
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
        child: Stack(
          children: [
            Image.asset(
              "assets/images/$image",
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 52,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    text,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
