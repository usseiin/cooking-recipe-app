import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/constants/route.dart';
import 'package:cooking_recipe_app/models/responsive_size.dart';
import 'package:cooking_recipe_app/screens/home/components/components.dart';
import 'package:cooking_recipe_app/screens/login_screen/component/components.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(
        iconlast2: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(profilePicRoute),
          child: Padding(
            padding: EdgeInsets.all(getProportionalScreenHeigth(15)),
            child: Hero(
              tag: "heroTag",
              child: Image.asset(
                "assets/images/userChat.png",
                height: double.infinity,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        icon: Icons.chevron_left,
        shadow: 4,
        shadowColor: black,
        text: "Diana Rose",
        favColor: const Color.fromARGB(131, 255, 255, 255),
        actPress: () => Navigator.of(context).pushNamed(
          profilePicRoute,
        ),
      ),
      body: Column(
        children: [
          height(getProportionalScreenHeigth(11)),
          Text(
            "You are doing great",
            style: detailText4style30,
          ),
          height(getProportionalScreenHeigth(11)),
          Text(
            "You have learnt 35 fatastic recipes in the last 30 days compared to previousmonth Rose.",
            style: detailText4style18,
            textAlign: TextAlign.center,
          ),
          height(getProportionalScreenHeigth(32)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionalScreenHeigth(15)),
            child: Image.asset(
              "assets/images/Bar Chart.png",
              height: getProportionalScreenHeigth(164),
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          height(getProportionalScreenHeigth(14)),
          Divider(
            thickness: getProportionalScreenHeigth(2),
          ),
          height(getProportionalScreenHeigth(21)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionalScreenWidth(28),
              vertical: getProportionalScreenHeigth(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "35",
                      style: detailText4style18,
                    ),
                    Row(
                      children: [
                        Text(
                          "Recipes learnt",
                          style: detailText3style,
                        ),
                        const Icon(Icons.circle),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.circle_outlined,
                  size: getProportionalScreenHeigth(50),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "2500+",
                      style: detailText4style18,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.circle),
                        Text(
                          "Total Recipes",
                          style: detailText3style,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          height(getProportionalScreenHeigth(21)),
          Divider(
            thickness: getProportionalScreenHeigth(2),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionalScreenWidth(18)),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Total recipes learnt',
                        style: detailText5style,
                      ),
                    ),
                    Text(
                      '35',
                      style: detailText5style,
                    ),
                    width(getProportionalScreenWidth(8)),
                    Icon(
                      Icons.chevron_right_outlined,
                      size: getProportionalScreenHeigth(20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Favorite recipe',
                        style: detailText5style,
                      ),
                    ),
                    Text(
                      '12',
                      style: detailText5style,
                    ),
                    width(getProportionalScreenWidth(8)),
                    Icon(
                      Icons.chevron_right_outlined,
                      size: getProportionalScreenHeigth(20),
                    ),
                  ],
                ),
                height(getProportionalScreenHeigth(2)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Extra Information',
                      style: detailText5ustyle,
                    ),
                    Divider(
                      thickness: 2,
                      color: greenColor,
                      endIndent: getProportionalScreenWidth(240),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Body weight',
                        style: detailText5style,
                      ),
                    ),
                    Text(
                      '63kg',
                      style: detailText5style,
                    ),
                    width(getProportionalScreenWidth(8)),
                    Icon(
                      Icons.chevron_right_outlined,
                      size: getProportionalScreenHeigth(20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Height',
                        style: detailText5style,
                      ),
                    ),
                    Text(
                      '1.7m',
                      style: detailText5style,
                    ),
                    width(getProportionalScreenWidth(8)),
                    Icon(
                      Icons.chevron_right_outlined,
                      size: getProportionalScreenHeigth(20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Change password',
                        style: detailText5style,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_outlined,
                      size: getProportionalScreenHeigth(20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Logout',
                        style: detailText5gstyle,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_outlined,
                      size: getProportionalScreenHeigth(20),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionalScreenWidth(62)),
            child: const AuthButton(text: "Keep Learning"),
          )
        ],
      ),
    );
  }
}
