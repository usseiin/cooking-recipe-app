import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/models/responsive_size.dart';
import 'package:cooking_recipe_app/screens/login_screen/component/components.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          height(getProportionalScreenHeigth(70)),
          SizedBox(
            height: getProportionalScreenHeigth(316),
            width: getProportionalScreenWidth(414),
            child: Image.asset(
              "assets/images/Hero Image.png",
              fit: BoxFit.fitHeight,
            ),
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
                    "Ready to learn?",
                    style: headText1style,
                  ),
                  height(getProportionalScreenHeigth(6)),
                  Text(
                    "Good to have you back ",
                    style: headText2style,
                  ),
                  height(getProportionalScreenWidth(56)),
                  const InputContainer(label: "Username", icon: Icons.person),
                  height(getProportionalScreenWidth(18)),
                  const InputContainer(label: "Password", icon: Icons.lock),
                  height(getProportionalScreenWidth(9)),
                  forgetPassword(),
                  height(getProportionalScreenWidth(81)),
                  const AuthButton(text: "Login"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
