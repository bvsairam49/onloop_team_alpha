import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextStyle headline2(double screenSizeFactor) {
    return GoogleFonts.raleway(
        fontSize: 55 * screenSizeFactor, fontWeight: FontWeight.bold);
  }

  static TextStyle headline3(double screenSizeFactor) {
    return GoogleFonts.raleway(fontSize: 50 * screenSizeFactor);
  }

  static TextStyle headline3Bold(double screenSizeFactor) {
    return GoogleFonts.raleway(
        fontSize: 50 * screenSizeFactor, fontWeight: FontWeight.bold);
  }

  static TextStyle headline4(double screenSizeFactor) {
    return GoogleFonts.raleway(fontSize: 36 * screenSizeFactor);
  }

  static TextStyle headline4Bold(double screenSizeFactor) {
    return GoogleFonts.raleway(
        fontSize: 36 * screenSizeFactor, fontWeight: FontWeight.bold);
  }

  static TextStyle headline5(double screenSizeFactor) {
    return GoogleFonts.raleway(fontSize: 26 * screenSizeFactor);
  }

  static TextStyle headline5Bold(double screenSizeFactor) {
    return GoogleFonts.raleway(
        fontSize: 26 * screenSizeFactor, fontWeight: FontWeight.bold);
  }

  static TextStyle headline5BoldPoppins(double screenSizeFactor) {
    return GoogleFonts.poppins(
        fontSize: 26 * screenSizeFactor, fontWeight: FontWeight.bold);
  }

  static TextStyle headline6(double screenSizeFactor) {
    return GoogleFonts.raleway(fontSize: 20 * screenSizeFactor);
  }

  static TextStyle headline6Bold(double screenSizeFactor) {
    return GoogleFonts.raleway(
        fontSize: 20 * screenSizeFactor, fontWeight: FontWeight.bold);
  }

  static TextStyle subtitle1(double screenSizeFactor) {
    return GoogleFonts.raleway(fontSize: 18 * screenSizeFactor);
  }

  static TextStyle subtitle1Bold(double screenSizeFactor) {
    return GoogleFonts.raleway(
        fontSize: 18 * screenSizeFactor, fontWeight: FontWeight.bold);
  }

  static TextStyle subtitle2(double screenSizeFactor) {
    return GoogleFonts.raleway(fontSize: 16 * screenSizeFactor);
  }

  static TextStyle subtitle2Bold(double screenSizeFactor) {
    return GoogleFonts.raleway(
        fontSize: 16 * screenSizeFactor, fontWeight: FontWeight.bold);
  }

  static TextStyle subtitle3(double screenSizeFactor) {
    return GoogleFonts.raleway(fontSize: 14 * screenSizeFactor);
  }

  static TextStyle subtitle3Bold(double screenSizeFactor) {
    return GoogleFonts.raleway(
        fontSize: 14 * screenSizeFactor, fontWeight: FontWeight.bold);
  }

  static TextStyle subtitle4(double screenSizeFactor) {
    return GoogleFonts.raleway(fontSize: 12 * screenSizeFactor);
  }

  static TextStyle subtitle4Bold(double screenSizeFactor) {
    return GoogleFonts.raleway(
        fontSize: 12 * screenSizeFactor, fontWeight: FontWeight.bold);
  }

  static TextStyle smallButton(double screenSizeFactor) {
    return GoogleFonts.raleway(fontSize: 16 * screenSizeFactor);
  }

  static TextStyle smallButtonBold(double screenSizeFactor) {
    return GoogleFonts.raleway(
        fontSize: 16 * screenSizeFactor, fontWeight: FontWeight.bold);
  }

  static TextStyle largeButton(double screenSizeFactor) {
    return GoogleFonts.raleway(fontSize: 50 * screenSizeFactor);
  }

  static TextStyle error(double screenSizeFactor) {
    return TextStyle(fontSize: 12 * screenSizeFactor);
  }

  static TextStyle drawerMenuTitle(double screenSizeFactor) {
    return GoogleFonts.roboto(
        fontSize: 20 * screenSizeFactor, fontWeight: FontWeight.bold);
  }

  static TextStyle drawerMenuSubtitle(double screenSizeFactor) {
    return GoogleFonts.roboto(
        fontSize: 15 * screenSizeFactor, fontWeight: FontWeight.normal);
  }

  static TextStyle drawerMenuItem(double screenSizeFactor) {
    return GoogleFonts.roboto(fontSize: 20 * screenSizeFactor);
  }

  static TextStyle tagTitle(double screenSizeFactor) {
    return TextStyle(fontSize: 12 * screenSizeFactor);
  }

  static TextStyle feedbackTypeEmojiLarge(double screenSizeFactor) {
    return TextStyle(fontSize: 70 * screenSizeFactor);
  }

  static TextStyle feedbackTypeEmojiSmall(double screenSizeFactor) {
    return TextStyle(fontSize: 40 * screenSizeFactor);
  }

  static TextStyle openSans(
      {fontSize: num,
      fontWeight: FontWeight,
      FontStyle fontStyle,
      Color color,
      TextDecoration decoration,
      double height}) {
    return GoogleFonts.openSans(
        fontSize: fontSize.toDouble() ?? 14.0,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontStyle: fontStyle ?? FontStyle.normal,
        color: color ?? Color(0xFF778391),
        decoration: decoration,
        height: height);
  }

  static TextStyle poppins({
    fontSize: num,
    fontWeight: FontWeight,
    FontStyle fontStyle,
    Color color,
    TextDecoration decoration,
    double height,
    double letterSpacing,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize.toDouble() ?? 14.0,
      fontWeight: fontWeight ?? FontWeight.normal,
      fontStyle: fontStyle ?? FontStyle.normal,
      color: color ?? Color(0xFF778391),
      decoration: decoration,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  /// Merri Weather - Google fonts
  ///
  /// fonts for [merriWeather] font family
  static TextStyle merriWeather({
    num fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    Color color,
    TextDecoration decoration,
    double height,
    double letterSpacing,
  }) {
    return GoogleFonts.merriweather(
      fontSize: fontSize?.toDouble() ?? 14.0,
      fontWeight: fontWeight ?? FontWeight.normal,
      fontStyle: fontStyle ?? FontStyle.normal,
      color: color ?? const Color(0xFF778391),
      decoration: decoration,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
}
