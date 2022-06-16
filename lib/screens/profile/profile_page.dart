import 'package:cooking_recipe_app/constants/route.dart';
import 'package:cooking_recipe_app/screens/home/components/components.dart';
import 'package:cooking_recipe_app/screens/login_screen/component/components.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        text: "Diana Rose",
        iconlast: Icons.person,
        actPress: () => Navigator.of(context).pushNamedAndRemoveUntil(
          profilePicRoute,
          (route) => false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("You are doing great"),
            const Text(
                "You have learnt 35 fatastic recipes in the last 30 days compared to previousmonth Rose."),
            Image.asset("assets/images/Bar Chart.png"),
            Row(
              children: [
                Column(
                  children: [
                    const Text("35"),
                    Row(
                      children: const [
                        Text("Recipes learnt"),
                        Icon(Icons.circle),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.circle_outlined,
                  size: 50,
                ),
                Column(
                  children: [
                    const Text("2500+"),
                    Row(
                      children: const [
                        Icon(Icons.circle),
                        Text("Total Recipes"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            ListView.builder(
                itemBuilder: (context, index) => Row(
                      children: const [
                        Expanded(child: Text('Total recipe Learnt')),
                        Text('35'),
                        Icon(Icons.chevron_right_outlined),
                      ],
                    )),
            const AuthButton(text: "Keep Learning")
          ],
        ),
      ),
    );
  }
}
