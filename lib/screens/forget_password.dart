import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/responsive_size.dart';
import '../services/auth_services.dart';
import 'login_screen/component/components.dart';

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
