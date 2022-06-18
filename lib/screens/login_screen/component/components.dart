import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/models/responsive_size.dart';
import 'package:flutter/material.dart';

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
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                vertical: getProportionalScreenHeigth(10))),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(getProportionalScreenHeigth(30))))),
        onPressed: function,
        child: Text(text, style: button1style),
      ),
    );
  }
}

Align forgetPassword() {
  return Align(
    alignment: Alignment.centerRight,
    child: Padding(
      padding: EdgeInsets.only(right: getProportionalScreenHeigth(8.0)),
      child: Text(
        "Forget password",
        style: dontHavAcc2style,
        textAlign: TextAlign.end,
      ),
    ),
  );
}

class InputContainer extends StatelessWidget {
  const InputContainer(
      {super.key, required this.label, required this.icon, this.suffixIcon});

  final String label;
  final IconData icon;
  final dynamic suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getProportionalScreenWidth(22)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(getProportionalScreenHeigth(30)),
          shape: BoxShape.rectangle,
          color: const Color.fromARGB(255, 211, 211, 211)),
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: getProportionalScreenHeigth(15.5),
                horizontal: getProportionalScreenWidth(22)),
            prefixIcon: Icon(
              icon,
              size: getProportionalScreenHeigth(30),
            ),
            label: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(label, style: inputLabelStyle),
            ),
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
            borderRadius:
                BorderRadius.circular(getProportionalScreenHeigth(30)),
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
