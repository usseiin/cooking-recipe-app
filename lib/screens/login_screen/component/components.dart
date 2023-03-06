import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/utils/responsive_size.dart';
import 'package:flutter/material.dart';

import '../../forget_password.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.text,
    this.function,
  }) : super(key: key);

  final String text;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(greenColor),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: getProportionalScreenHeigth(10)),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(getProportionalScreenHeigth(30)),
            ),
          ),
        ),
        onPressed: function,
        child: Text(text, style: button1style),
      ),
    );
  }
}

Align forgetPassword(BuildContext context) {
  return Align(
    alignment: Alignment.centerRight,
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ForgetPassword(),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(right: getProportionalScreenHeigth(8.0)),
        child: Text(
          "Forget password",
          style: dontHavAcc2style,
          textAlign: TextAlign.end,
        ),
      ),
    ),
  );
}

class InputContainer extends StatelessWidget {
  const InputContainer({
    super.key,
    required this.label,
    required this.icon,
    this.suffixIcon,
    required this.controller,
    required this.keyboardType,
    this.isObscure,
  });

  final String label;
  final IconData icon;
  final dynamic suffixIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool? isObscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getProportionalScreenWidth(12)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(getProportionalScreenHeigth(30)),
          shape: BoxShape.rectangle,
          color: const Color.fromARGB(255, 211, 211, 211)),
      child: TextFormField(
        obscureText: isObscure ?? false,
        controller: controller,
        autofocus: true,
        autocorrect: false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: getProportionalScreenHeigth(15.5),
                horizontal: getProportionalScreenWidth(4)),
            prefixIcon: Icon(
              icon,
              size: getProportionalScreenHeigth(30),
            ),
            hintText: label,
            border: InputBorder.none),
      ),
    );
  }
}

SizedBox socialButton(text, function) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: function,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(greenColor),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: getProportionalScreenHeigth(12))),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              getProportionalScreenHeigth(30),
            ),
          ),
        ),
      ),
      child: Text(
        text,
        style: button1style,
      ),
    ),
  );
}
