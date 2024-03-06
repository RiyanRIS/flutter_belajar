import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

var primaryColor = const Color(0xFF0079FB);
var secondaryColor = const Color(0xFF9FADBC);
var whiteBackground = const Color(0xFFFAFAFA);
var mainGreyColor = const Color(0xFF3D3D3D);

const kBackgroundColor = Color(0xFFF8F8F8);
const kActiveIconColor = Color(0xFFE68342);
const kTextColor = Color(0xFF222B45);
const kBlueLightColor = Color(0xFFC7B8F5);
const kBlueColor = Color(0xFF817DC0);
const kShadowColor = Color(0xFFE6E6E6);

const sizeBoxVertical_5 = SizedBox(
  height: 5,
);

const sizeBoxVertical_8 = SizedBox(
  height: 8,
);

const sizeBoxVertical_12 = SizedBox(
  height: 12,
);

const sizeBoxVertical_16 = SizedBox(
  height: 16,
);

const sizeBoxVertical_24 = SizedBox(
  height: 24,
);

const sizeboxHorizontal_8 = SizedBox(
  width: 8,
);

const double leftAndRightPadding = 10;

var heading1 = const TextStyle(
    color: Color(0xFF4E76A0), fontSize: 18, fontWeight: FontWeight.bold);
var text12Grey = const TextStyle(color: Color(0xFF9FADBC), fontSize: 12);
var text12GreyItalic = const TextStyle(
    color: Color(0xFF9FADBC), fontSize: 12, fontStyle: FontStyle.italic);
var text12GreyBold = const TextStyle(
    color: Color(0xFF9FADBC), fontSize: 12, fontWeight: FontWeight.bold);

var text12Black = TextStyle(color: mainGreyColor, fontSize: 12);
var text12BlackBold =
    TextStyle(color: mainGreyColor, fontSize: 12, fontWeight: FontWeight.bold);

var text14Main = const TextStyle(color: Color(0xFF9FADBC), fontSize: 14);

var text14BlackBold = const TextStyle(
    color: Color(0xFF1E1E1E), fontSize: 14, fontWeight: FontWeight.bold);

var text14MainGrey = const TextStyle(color: Color(0xFF3D3D3D), fontSize: 14);
var text14MainWhiteBold = TextStyle(
    color: whiteBackground, fontSize: 14, fontWeight: FontWeight.bold);
var text14MainWhite = TextStyle(color: whiteBackground, fontSize: 14);
var text14BlueBold = const TextStyle(
    color: Color(0xFF3E6794), fontSize: 14, fontWeight: FontWeight.bold);
var text16MainGrey = const TextStyle(color: Color(0xFF3D3D3D), fontSize: 16);
var text16MainBold = const TextStyle(
    color: Color(0xFF4E76A0), fontSize: 16, fontWeight: FontWeight.bold);
var text16MainBlack = TextStyle(color: mainGreyColor, fontSize: 16);
var text16MainBlackBold =
    TextStyle(color: mainGreyColor, fontSize: 16, fontWeight: FontWeight.bold);
var text16Second = TextStyle(color: secondaryColor, fontSize: 16);
var text16MainWhiteBold = TextStyle(
    color: whiteBackground, fontSize: 16, fontWeight: FontWeight.bold);
var text16MainWhite = TextStyle(color: whiteBackground, fontSize: 16);
var text20BlackBold = const TextStyle(
    color: Color(0xFF1E1E1E), fontSize: 20, fontWeight: FontWeight.bold);
var text20WhiteBold = TextStyle(
    color: whiteBackground, fontSize: 20, fontWeight: FontWeight.bold);
var text24BlackBold = const TextStyle(
    color: Color(0xFF1E1E1E), fontSize: 24, fontWeight: FontWeight.bold);
var text26WhiteBold = TextStyle(
    color: whiteBackground, fontSize: 26, fontWeight: FontWeight.bold);

OutlineInputBorder defaultOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(color: Color(0xFFF3F3F3)),
);
