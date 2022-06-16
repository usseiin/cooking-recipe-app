import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/constants/route.dart';
import 'package:cooking_recipe_app/screens/login_screen/component/components.dart';
import 'package:cooking_recipe_app/screens/login_screen/signup.dart';
import 'package:flutter/material.dart';

class LoginSocial extends StatelessWidget {
  const LoginSocial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Image.asset("assets/images/Image.png"),
          ),
          socialButton(
              "Login with Google",
              () => Navigator.pushNamedAndRemoveUntil(
                  context, signInRoute, (route) => false)),
          socialButton("Login with Facebook", null),
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
    );
  }
}
