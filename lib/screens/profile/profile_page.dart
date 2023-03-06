import 'dart:math';

import 'package:bar_chart/bar_chart.dart';
import 'package:circular_progress/circular_progress.dart';
import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/utils/responsive_size.dart';
import 'package:cooking_recipe_app/screens/home/components/components.dart';
import 'package:cooking_recipe_app/screens/profile/profile_picture.dart';
import 'package:cooking_recipe_app/services/auth_services.dart';
import 'package:flutter/material.dart';

import '../../utils/logic.dart';
import '../login_screen/component/components.dart';
import '../login_screen/signin.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const String route = "/profile_page";

  @override
  Widget build(BuildContext context) {
    final values = List.generate(30, (index) => Random().nextDouble() * 100);
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(
        iconlast2: GestureDetector(
          onTap: () =>
              Navigator.of(context).pushNamed(ProfilePictureScreen.route),
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
        text: AuthService().currentUser()!.username,
        favColor: const Color.fromARGB(131, 255, 255, 255),
        actPress: () => Navigator.of(context).pushNamed(
          ProfilePictureScreen.route,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            height(getProportionalScreenHeigth(6)),
            Text(
              "You are doing great",
              style: detailText4style30,
            ),
            height(getProportionalScreenHeigth(6)),
            Text(
              "You have learnt 35 fatastic recipes in the last 30 days compared to previousmonth Rose.",
              style: detailText4style18,
              textAlign: TextAlign.center,
            ),
            ProfileProgressBoard(values: values),
            Divider(
              thickness: getProportionalScreenHeigth(2),
            ),
            const ProfileDetailsBoard(),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionalScreenWidth(62)),
              child: const AuthButton(text: "Keep Learning"),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileDetailsBoard extends StatelessWidget {
  const ProfileDetailsBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionalScreenWidth(18)),
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
              GestureDetector(
                onTap: () {
                  AuthService().signOut();
                  Navigator.pushNamed(context, SignInScreen.route);
                },
                child: Icon(
                  Icons.chevron_right_outlined,
                  size: getProportionalScreenHeigth(20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileProgressBoard extends StatelessWidget {
  const ProfileProgressBoard({
    super.key,
    required this.values,
  });

  final List<double> values;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          margin:
              EdgeInsets.symmetric(horizontal: getProportionalScreenHeigth(15)),
          child: CustomPaint(
            painter: BarChart(values: values, maxValue: 100),
          ),
        ),
        Divider(
          thickness: getProportionalScreenHeigth(2),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionalScreenWidth(28),
            vertical: getProportionalScreenHeigth(10),
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
              Container(
                  height: 35,
                  width: 35,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  child: CustomPaint(
                    painter: CircularProgress()
                      ..progress = 35
                      ..progressThickness = .3,
                  )),
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
      ],
    );
  }
}
