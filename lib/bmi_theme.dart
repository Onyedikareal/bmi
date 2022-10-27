import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';



class BMITheme {
  static Color lightThemeTextColor = const Color(0xff4d4d4d);
  static Color darkThemeTextColor = const Color(0xfffefefe);

  static TextTheme primaryTextThemeLight = TextTheme(
    bodyText1: GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: const Color(0xff4d4d4d),
    ),
    bodyText2: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: const Color(0xff4d4d4d),
    ),
    headline1: GoogleFonts.roboto(
      fontSize: 34.0,
      fontWeight: FontWeight.w700,
      color: const Color(0xff4d4d4d),
    ),
    headline2: GoogleFonts.roboto(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: const Color(0xff4d4d4d),
    ),
    headline3: GoogleFonts.roboto(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: const Color(0xff4d4d4d),
    ),
    headline4: GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: const Color(0xff4d4d4d),
    ),
    headline5: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: const Color(0xff4d4d4d),
    ),
    headline6: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: const Color(0xff4d4d4d),
    ),
    subtitle1: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: const Color(0xff4d4d4d),
    ),
    subtitle2: GoogleFonts.roboto(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      color: const Color(0xff4d4d4d),
    ),
  );

  static TextTheme primaryTextThemeDark = TextTheme(
    bodyText1: GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: darkThemeTextColor,
    ),
    bodyText2: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: darkThemeTextColor,
    ),
    headline1: GoogleFonts.roboto(
      fontSize: 34.0,
      fontWeight: FontWeight.w700,
      color: darkThemeTextColor,
    ),
    headline2: GoogleFonts.roboto(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: darkThemeTextColor,
    ),
    headline3: GoogleFonts.roboto(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: darkThemeTextColor,
    ),
    headline4: GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: darkThemeTextColor,
    ),
    headline5: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: darkThemeTextColor,
    ),
    headline6: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: darkThemeTextColor,
    ),
    subtitle1: GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: darkThemeTextColor,
    ),
    subtitle2: GoogleFonts.roboto(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      color: darkThemeTextColor,
    ),
  );

  static IconThemeData darkIconTheme = IconThemeData(color: Color(0xffafafaf));
  static IconThemeData lightIconTheme = IconThemeData(color: Colors.grey[900]);
  static DrawerThemeData drawerTheme = DrawerThemeData(
    backgroundColor: const Color(0xff1F88C1),
  );

  static DrawerThemeData darkThemeDrawerTheme = DrawerThemeData(
    backgroundColor: const Color(0xff0C4D69),
  );

  static ThemeData light() {
    return ThemeData(
        brightness: Brightness.light,
        indicatorColor: const Color(0xff1F88C1),
        primaryColor: const Color(0xff1F88C1),
        primaryColorDark: const Color(0xff00374E),
        cardColor: const Color(0xfffdfdfd),
        backgroundColor: Colors.white,
        dialogBackgroundColor: Colors.white,
        shadowColor: Colors.grey,
        scaffoldBackgroundColor: const Color(0xffFDFEFF),
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Colors.pinkAccent,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.pinkAccent,
                statusBarBrightness: Brightness.light,
                systemNavigationBarContrastEnforced: false,
                systemNavigationBarColor: Color(0xff1F88C1))),
        buttonTheme: const ButtonThemeData(colorScheme: ColorScheme.light(background: Colors.red)),
        primaryTextTheme: primaryTextThemeLight);
  }

  static ThemeData dark() {
    Color darkThemeColor =const Color(0xff00161f);
    Color darkCardColor =const Color(0xff062735);

    return ThemeData(
        brightness: Brightness.dark,
        indicatorColor: const Color(0xff1F88C1),
        primaryColor: const Color(0xff1F88C1),
        primaryColorDark: darkThemeColor,
        backgroundColor: darkThemeColor,
        cardColor: darkCardColor,
        scaffoldBackgroundColor: darkThemeColor,
        iconTheme: darkIconTheme,
        appBarTheme: AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: darkCardColor,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: darkCardColor,
                statusBarBrightness: Brightness.dark,
                systemNavigationBarContrastEnforced: false,
                systemNavigationBarColor:const Color(0xff1F88C1))),
        
        buttonTheme:const ButtonThemeData(colorScheme: ColorScheme.light(background: Colors.red)),
        primaryTextTheme: primaryTextThemeDark);
  }
}
