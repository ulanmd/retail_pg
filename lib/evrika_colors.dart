import 'package:flutter/material.dart';

class EvrikaColors {
  static const Color kPrimaryColor = Color(0xff029aad);
  static const Color darkColor = Color.fromRGBO(0, 21, 41, 1);
  static const Color greyText = Color(0xff7F7F7F);
  static const Color mainOrange = Color(0xffFF7A01);
  static const Color boxShadowColor = Color(0xffF0F0F0);
  static const Color completedTextColor = Color(0xff05AF53);
  static const Color inProcessColor = Color(0xff0069FF);
  static const Color cancelledColor = Color(0xffD60000);
  static const Color borderGreyColor = Color(0xffc4c4c4);
  static const Color lightBlueColor = Color(0xffDDEEF2);



  static const Color kLightColor = Color(0xffE0E0E0);
  static const Color kErrorColor = Color(0xFFB84A5D);
  static const Color kSuccessColor = Color(0xff27AE60);
  static const Color kWarningColor = Color(0xFFF2994A);

  static const Color black = Colors.black;
  static final Color white = Color.fromRGBO(255, 255, 255, 1);
  static final Color lightBlue = Color.fromRGBO(221, 238, 242, 1);

  static final MaterialColor themePrimaryColor = const MaterialColor(
    0xff029aad,
    <int, Color>{
      50: kPrimaryColor,
      100: kPrimaryColor,
      200: kPrimaryColor,
      300: kPrimaryColor,
      400: kPrimaryColor,
      500: kPrimaryColor,
      600: kPrimaryColor,
      700: kPrimaryColor,
      800: kPrimaryColor,
      900: kPrimaryColor,
    },
  );
}
