import 'package:flutter/material.dart';

const Color kWhite = Colors.white;
const Color kblack = Colors.black;
const Color kBlue = Color(0xff5663ff);
const Color kPrimary = Color.fromARGB(255, 8, 87, 99);
const Color kMenuIconColor = Color(0xff800000);

Map<int, Color> colorCodes = {
  100: const Color.fromRGBO(8, 87, 99, .1),
  200: const Color.fromRGBO(8, 87, 99, .2),
  300: const Color.fromRGBO(8, 87, 99, .3),
  400: const Color.fromRGBO(8, 87, 99, .4),
  500: const Color.fromRGBO(8, 87, 99, .5),
  600: const Color.fromRGBO(8, 87, 99, .6),
  700: const Color.fromRGBO(8, 87, 99, .7),
  800: const Color.fromRGBO(8, 87, 99, .8),
  900: const Color.fromRGBO(8, 87, 99, .9)
};
MaterialColor primary = MaterialColor(0xBB8338f4, colorCodes);
// Color(0xBB8338f4)
const TextStyle kBodyText =
    TextStyle(fontSize: 18, color: Colors.white, height: 1.5);
const TextStyle kBodyTextPrimary =
    TextStyle(fontSize: 18, color: kPrimary, height: 1.5);

const TextStyle kBodyTextBlack =
    TextStyle(fontSize: 18, color: Colors.black, height: 1.5);

double defaultMargin = 30.0;

FontWeight light = FontWeight.w300;
FontWeight reguler = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

Color primaryBlue = const Color(0xFFC11107);
Color textBlack = const Color(0xff222222);
Color textGrey = const Color(0xff94959b);
Color textWhiteGrey = const Color(0xfff1f1f5);

const TextStyle heading1 = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: kPrimary,
);
const TextStyle heading2 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: kPrimary,
);
const TextStyle heading3 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w700,
  color: kPrimary,
);

const TextStyle heading5 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

const TextStyle heading6 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

const TextStyle regular16pt = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

const TextStyle regular12pt =
    TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: kWhite);
const TextStyle regular24pt =
    TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: kWhite);

const TextStyle kMenuIconStyle = TextStyle(
  fontSize: 16,
  color: kPrimary,
  fontWeight: FontWeight.w400,
);
