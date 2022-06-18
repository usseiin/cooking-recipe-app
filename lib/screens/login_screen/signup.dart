import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/constants/route.dart';
import 'package:cooking_recipe_app/models/responsive_size.dart';
import 'package:cooking_recipe_app/screens/login_screen/component/components.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          height(getProportionalScreenHeigth(38)),
          Image.asset(
            "assets/images/Hero Image.png",
            height: getProportionalScreenHeigth(316),
            width: getProportionalScreenWidth(414),
            fit: BoxFit.fitHeight,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionalScreenWidth(62)),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Getting started",
                    style: headText1style,
                  ),
                  height(getProportionalScreenHeigth(6)),
                  Text(
                    "create an account",
                    style: headText2style,
                  ),
                  height(getProportionalScreenHeigth(38)),
                  const InputContainer(label: "Email", icon: Icons.email),
                  height(getProportionalScreenHeigth(15)),
                  const InputContainer(label: "Username", icon: Icons.person),
                  height(getProportionalScreenHeigth(15)),
                  const InputContainer(
                    label: "Password",
                    icon: Icons.lock,
                  ),
                  height(getProportionalScreenHeigth(9)),
                  forgetPassword(),
                  height(getProportionalScreenHeigth(32)),
                  AuthButton(
                    text: "Signup",
                    function: () =>
                        Navigator.of(context).pushNamedAndRemoveUntil(
                      navRoute,
                      (route) => false,
                    ), //goes to the main screen or verification screen
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
