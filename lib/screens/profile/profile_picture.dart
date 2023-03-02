import 'package:flutter/material.dart';

class ProfilePictureScreen extends StatelessWidget {
  const ProfilePictureScreen({Key? key}) : super(key: key);

  static const String route = "/profile_pic_screen";

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "heroTag",
      child: Image.asset(
        "assets/images/Profile Picture.png",
        width: double.infinity,
        fit: BoxFit.fill,
        height: double.infinity,
      ),
    );
  }
}
