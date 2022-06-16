import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar({
  required String text,
  IconData? icon,
  double? shadow,
  Color? shadowColor,
  IconData? iconlast,
  Function()? leadPress,
  Function()? actPress,
}) {
  return AppBar(
    primary: true,
    elevation: shadow ?? 0,
    shadowColor: shadowColor ?? Colors.transparent,
    backgroundColor: white,
    leading: IconButton(
      onPressed: leadPress,
      icon: Icon(icon),
    ),
    title: Center(
      child: Text(
        text,
        style: titleTextStyle,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: IconButton(
          onPressed: actPress,
          icon: Icon(
            iconlast,
            color: Colors.red,
          ),
        ),
      )
    ],
  );
}
