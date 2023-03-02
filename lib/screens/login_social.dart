import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/models/responsive_size.dart';
import 'package:cooking_recipe_app/screens/login_screen/component/components.dart';
import 'package:cooking_recipe_app/screens/login_screen/signin.dart';
import 'package:cooking_recipe_app/screens/login_screen/signup.dart';
import 'package:flutter/material.dart';

class LoginSocial extends StatelessWidget {
  const LoginSocial({Key? key}) : super(key: key);

  static const String route = "/login_screen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            height(getProportionalScreenHeigth(78)),
            SizedBox(
              height: getProportionalScreenHeigth(428),
              width: getProportionalScreenWidth(414),
              child: Image.asset(
                "assets/images/Image.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionalScreenWidth(62)),
              child: Column(
                children: [
                  height(getProportionalScreenHeigth(42)),
                  socialButton("Login with Google", null),
                  height(getProportionalScreenHeigth(13)),
                  socialButton("Login with Facebook", null),
                  height(getProportionalScreenHeigth(13)),
                  socialButton(
                    "Login with Email",
                    () => Navigator.pushNamedAndRemoveUntil(
                        context, SignInScreen.route, (route) => false),
                  ),
                  height(getProportionalScreenHeigth(22)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: dontHavAccStyle,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen())),
                        child: Text(
                          "Sign Up",
                          style: dontHavAcc2style,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
