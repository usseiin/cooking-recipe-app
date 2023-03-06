// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/screens/home/home_nav.dart';
import 'package:cooking_recipe_app/utils/responsive_size.dart';
import 'package:cooking_recipe_app/services/auth_services.dart';
import 'package:flutter/material.dart';

import '../../utils/logic.dart';
import 'component/components.dart';
import 'signin.dart';

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

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late final TextEditingController _email;
  late final TextEditingController _username;
  late final TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _username = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

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
                  InputContainer(
                    keyboardType: TextInputType.emailAddress,
                    label: "Email",
                    icon: Icons.email,
                    controller: _email,
                  ),
                  height(getProportionalScreenHeigth(15)),
                  InputContainer(
                    keyboardType: TextInputType.text,
                    label: "Username",
                    icon: Icons.person,
                    controller: _username,
                  ),
                  height(getProportionalScreenHeigth(15)),
                  InputContainer(
                    isObscure: true,
                    label: "Password",
                    icon: Icons.lock,
                    controller: _password,
                    keyboardType: TextInputType.text,
                  ),
                  height(getProportionalScreenHeigth(9)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: dontHavAccStyle,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()),
                        ),
                        child: Text(
                          "Sign in",
                          style: dontHavAcc2style,
                        ),
                      ),
                    ],
                  ),
                  height(getProportionalScreenHeigth(9)),
                  forgetPassword(context),
                  height(getProportionalScreenHeigth(32)),
                  AuthButton(
                    text: "Signup",
                    function: () async {
                      final email = _email.text;
                      final password = _password.text;
                      final username = _username.text;
                      final user = await AuthService()
                          .createAccountWithEmailAndPassword(
                              email: email,
                              password: password,
                              username: username);
                      if (user.userId.isNotEmpty) {
                        if (mounted) {
                          Navigator.pushNamed(context, RecipeHomeNav.route);
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
