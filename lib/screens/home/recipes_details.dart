import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/screens/home/components/components.dart';
import 'package:cooking_recipe_app/utils/utils.dart';
import "package:flutter/material.dart";

class RecipesDetailScreen extends StatefulWidget {
  const RecipesDetailScreen({Key? key}) : super(key: key);

  @override
  State<RecipesDetailScreen> createState() => _RecipesDetailScreenState();
}

class _RecipesDetailScreenState extends State<RecipesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          text: "Homemade Pizza",
          shadow: 0,
          icon: Icons.chevron_left,
          iconlast: Icons.favorite),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List list = List.generate(4, (index) => "list generate $index");
    List list2 = List.generate(14, (index) => "2 cups of purpose flour");
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            "assets/images/pizza.png",
            height: 251,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Ingredient",
                  style: detailText1style,
                ),
              ),
              Table(
                children: createTable(list2, Colors.yellow),
              ),
              const SizedBox(
                height: 8,
              ),
              Table(
                children: createTable(list, black),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Preparation",
                  style: detailText1style,
                ),
              ),
              Text(
                "Step 1 : Prepare the pizza dough. Take a dough kneading plate and add all-purpose flour to it. Next, add salt and baking powder in it and sieve the flour once. Then, make a well in the centre and add 1 teaspoon of oil to it. On the other hand, take a little warm water and mix the yeast in it along with 1 teaspoon of sugar. Mix well for 10mins. The yeast will rise in the meantime. Once the yeast has risen, add it to the flour knead the dough nicely using some water. Keep this dough aside for 4-6 hours. Then knead the dough once again. Now, the pizza dough is ready. Read more",
                style: detailText2style,
              )
            ],
          ),
        ),
      ],
    );
  }
}
