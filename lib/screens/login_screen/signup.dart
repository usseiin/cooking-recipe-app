import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/constants/route.dart';
import 'package:cooking_recipe_app/screens/login_screen/component/components.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset("assets/images/Hero Image.png"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Getting started",
                    style: headText1style,
                  ),
                  Text(
                    "create an account",
                    style: headText2style,
                  ),
                  const InputContainer(label: "Email", icon: Icons.email),
                  const InputContainer(label: "Username", icon: Icons.man),
                  const InputContainer(
                    label: "Password",
                    icon: Icons.lock,
                  ),
                  forgetPassword(),
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
