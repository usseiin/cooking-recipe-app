import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/constants/route.dart';
import 'package:cooking_recipe_app/firebase_options.dart';
import 'package:cooking_recipe_app/models/responsive_size.dart';
import 'package:cooking_recipe_app/screens/home/home_nav.dart';
import 'package:cooking_recipe_app/screens/home/start_learning.dart';
import 'package:cooking_recipe_app/screens/login_screen/component/components.dart';
import 'package:cooking_recipe_app/screens/login_screen/signin.dart';
import 'package:cooking_recipe_app/screens/profile/profile_page.dart';
import 'package:cooking_recipe_app/screens/profile/profile_picture.dart';
import 'package:cooking_recipe_app/screens/recipe_home/login_social.dart';
import 'package:cooking_recipe_app/services/auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      routes: {
        loginSocialRoute: (context) => const LoginSocial(),
        startLearningRoute: (context) => const StartLearning(),
        navRoute: (context) => const RecipeHomeNav(),
        profilePicRoute: (context) => const ProfilePictureScreen(),
        profilePageRoute: (context) => const ProfilePage(),
        signInRoute: (context) => const SignInScreen(),
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return const LoginSocial();
          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}

class ConnectionError extends StatelessWidget {
  const ConnectionError({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Network Error..."),
      ),
    );
  }
}

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late final TextEditingController _email;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
  }

  @override
  void dispose() {
    _email = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionalScreenWidth(20),
            vertical: getProportionalScreenHeigth(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Please enter your email to get the reset password link to your mail.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              height(
                getProportionalScreenHeigth(12),
              ),
              InputContainer(
                keyboardType: TextInputType.emailAddress,
                label: "Enter email here",
                icon: Icons.email,
                controller: _email,
              ),
              height(
                getProportionalScreenHeigth(15),
              ),
              AuthButton(
                text: "Retrieve Password",
                function: () async {
                  final email = _email.text;
                  await AuthService().forgetPassword(email: email);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  late final TextEditingController _email;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionalScreenWidth(20),
            vertical: getProportionalScreenHeigth(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Please enter your email to get the email verificaton link sent to your mail.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              height(
                getProportionalScreenHeigth(12),
              ),
              InputContainer(
                keyboardType: TextInputType.emailAddress,
                label: "Enter email here",
                icon: Icons.email,
                controller: _email,
              ),
              height(
                getProportionalScreenHeigth(15),
              ),
              AuthButton(
                text: "Retrieve Password",
                function: () async {
                  final email = _email.text;
                  await AuthService().sendEmailVerification(
                    email: email,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
