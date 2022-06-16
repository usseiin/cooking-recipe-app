import 'package:cooking_recipe_app/models/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color greenColor = Color.fromRGBO(37, 104, 20, 1);

const Color black = Color.fromRGBO(0, 0, 0, 1);

const Color lightBlack = Color.fromRGBO(133, 132, 132, 1);

const Color inputLabelColor = Color.fromRGBO(11, 10, 10, 1);

const Color white = Color.fromRGBO(255, 255, 255, 1);

SizedBox height(double val) => SizedBox(height: val);

SizedBox width(double val) => SizedBox(width: val);

TextStyle button1style = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: getProportionalScreenHeigth(25),
    color: white);

TextStyle headText1style = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: getProportionalScreenHeigth(35),
    color: black);

TextStyle headText2style = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: getProportionalScreenHeigth(20),
    color: black);

TextStyle inputLabelStyle = GoogleFonts.poppins(
    color: inputLabelColor,
    fontWeight: FontWeight.w400,
    fontSize: getProportionalScreenHeigth(20));

TextStyle dontHavAccStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: getProportionalScreenHeigth(15),
    color: lightBlack);

TextStyle titleTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: getProportionalScreenHeigth(26),
    color: black);

TextStyle prodCardTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: getProportionalScreenHeigth(12),
    color: black);

TextStyle detailText1style = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: getProportionalScreenHeigth(15),
    color: black);

TextStyle detailText2style = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: getProportionalScreenHeigth(11),
    color: black);

TextStyle detailText3style = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: const Color.fromRGBO(0, 0, 0, .8));

TextStyle detailText4style = GoogleFonts.poppins(
  fontWeight: FontWeight.w600,
  fontSize: 12,
  color: const Color.fromRGBO(0, 0, 0, 1),
);

TextStyle detailText4style18 = GoogleFonts.poppins(
  fontWeight: FontWeight.w400,
  fontSize: 18,
  color: const Color.fromRGBO(0, 0, 0, 1),
);

TextStyle detailText4style30 = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 30,
    color: const Color.fromRGBO(0, 0, 0, 1));

TextStyle dontHavAcc2style = GoogleFonts.poppins(
    color: greenColor,
    fontSize: getProportionalScreenHeigth(13),
    fontWeight: FontWeight.w400);
