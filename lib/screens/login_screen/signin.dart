// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/constants/route.dart';
import 'package:cooking_recipe_app/models/responsive_size.dart';
import 'package:cooking_recipe_app/screens/login_screen/component/components.dart';
import 'package:cooking_recipe_app/screens/login_screen/signup.dart';
import 'package:cooking_recipe_app/services/auth_services.dart';
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

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late final TextEditingController _username;
  late final TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

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
              horizontal: getProportionalScreenWidth(62),
            ),
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
                  InputContainer(
                    keyboardType: TextInputType.text,
                    label: "Username",
                    icon: Icons.person,
                    controller: _username,
                  ),
                  height(getProportionalScreenWidth(18)),
                  InputContainer(
                    isObscure: true,
                    label: "Password",
                    icon: Icons.lock,
                    controller: _password,
                    keyboardType: TextInputType.text,
                  ),
                  height(getProportionalScreenWidth(9)),
                  forgetPassword(context),
                  height(getProportionalScreenWidth(9)),
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
                              builder: (context) => const SignUpScreen()),
                        ),
                        child: Text(
                          "Sign Up",
                          style: dontHavAcc2style,
                        ),
                      ),
                    ],
                  ),
                  height(getProportionalScreenWidth(61)),
                  AuthButton(
                    text: "Login",
                    function: () async {
                      final username = _username.text;
                      final password = _password.text;
                      final user =
                          await AuthService().signInWithEmailAndPassword(
                        email: username,
                        password: password,
                      );
                      log("${AuthService().currentUser()}");
                      log(user?.toString() ?? "not user");
                      if (user != null) {
                        if (mounted) {
                          Navigator.of(context).pushNamed(startLearningRoute);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
