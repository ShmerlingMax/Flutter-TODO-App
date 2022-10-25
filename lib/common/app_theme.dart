import 'package:todo/common/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static Color importanceColor = const Color.fromRGBO(255, 59, 48, 1);

  static Future<AppTheme> init() async {
    final prefs = await SharedPreferences.getInstance();
    var currentValue = prefs.getBool(newColorEnabled) ?? false;
    importanceColor = currentValue
        ? const Color.fromRGBO(121, 60, 216, 1)
        : const Color.fromRGBO(255, 59, 48, 1);
    return AppTheme();
  }

  static const _defaultFontFamily = 'Roboto';

  //light
  static var lightSupportSeparator = const Color.fromRGBO(0, 0, 0, 0.2);
  static var lightSupportOverlay = const Color.fromRGBO(0, 0, 0, 0.06);
  static var lightLabelPrimary = Colors.black;
  static var lightLabelSecondary = const Color.fromRGBO(0, 0, 0, 0.6);
  static var lightLabelTertiary = const Color.fromRGBO(0, 0, 0, 0.3);
  static var lightLabelDisable = const Color.fromRGBO(0, 0, 0, 0.15);
  static var lightCustomGrayLight = const Color.fromRGBO(209, 209, 214, 1);
  static var lightBackPrimary = const Color.fromRGBO(247, 246, 242, 1);
  static var lightBackSecondary = Colors.white;
  static var lightBackElevated = Colors.white;

  //dark
  static var darkSupportSeparator = const Color.fromRGBO(255, 255, 255, 0.2);
  static var darkSupportOverlay = const Color.fromRGBO(0, 0, 0, 0.32);
  static var darkLabelPrimary = Colors.white;
  static var darkLabelSecondary = const Color.fromRGBO(255, 255, 255, 0.6);
  static var darkLabelTertiary = const Color.fromRGBO(255, 255, 255, 0.4);
  static var darkLabelDisable = const Color.fromRGBO(255, 255, 255, 0.15);
  static var darkCustomGrayLight = const Color.fromRGBO(72, 72, 74, 1);
  static var darkBackPrimary = const Color.fromRGBO(22, 22, 24, 1);
  static var darkBackSecondary = const Color.fromRGBO(37, 37, 40, 1);
  static var darkBackElevated = const Color.fromRGBO(60, 60, 63, 1);

  //common
  static var customRed = const Color.fromRGBO(255, 59, 48, 1);
  static var customGreen = const Color.fromRGBO(52, 199, 89, 1);
  static var customBlue = const Color.fromRGBO(0, 122, 255, 1);
  static var customGray = const Color.fromRGBO(142, 142, 147, 1);
  static var customWhite = Colors.white;

  static ThemeData getLight(
    double iconScaleFactor,
    double floatingActionButtonScaleFactor,
    double textScaleFactor,
  ) {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightBackPrimary,
      disabledColor: lightLabelDisable,
      fontFamily: _defaultFontFamily,
      hintColor: lightLabelTertiary,
      toggleableActiveColor: customBlue,
      dividerTheme: DividerThemeData(
        color: lightSupportSeparator,
        thickness: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightBackSecondary,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide.none,
        ),
      ),
      iconTheme:
          IconThemeData(color: lightLabelTertiary, size: 24 * iconScaleFactor),
      appBarTheme: AppBarTheme(
        backgroundColor: lightBackPrimary,
        iconTheme: IconThemeData(
          color: lightLabelPrimary,
          size: 24 * iconScaleFactor,
        ),
        scrolledUnderElevation: 4,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: lightBackPrimary,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: customBlue,
        foregroundColor: customWhite,
        sizeConstraints: const BoxConstraints.tightFor(
              width: 56.0,
              height: 56.0,
            ) *
            floatingActionButtonScaleFactor,
        iconSize: 24 * iconScaleFactor,
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
        ),
        side: BorderSide(
          width: 2,
          color: lightSupportSeparator,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              color: customBlue,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 24 / 14,
              letterSpacing: 0.16,
            ),
          ),
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: lightLabelPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 32,
          height: 38 / 32,
        ),
        headline2: TextStyle(
          color: lightLabelPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 20,
          height: 32 / 20,
          letterSpacing: 0.5,
        ),
        headline3: TextStyle(
          color: lightLabelTertiary,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 16.41 / 14,
        ),
        headline4: TextStyle(
          color: lightLabelPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 18.75 / 16,
        ),
        bodyText1: TextStyle(
          color: lightLabelTertiary,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 20 / 16,
        ),
        bodyText2: TextStyle(
          color: lightLabelPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 20 / 16,
        ),
        subtitle1: TextStyle(
          color: lightLabelPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 18 / 16,
        ),
        subtitle2: TextStyle(
          color: lightLabelTertiary,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 20 / 14,
        ),
        button: TextStyle(
          color: lightLabelPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 16 * textScaleFactor,
          height: 1,
        ),
      ),
    );
  }

  static ThemeData getDark(
    double iconScaleFactor,
    double floatingActionButtonScaleFactor,
    double textScaleFactor,
  ) {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackPrimary,
      disabledColor: darkLabelDisable,
      fontFamily: _defaultFontFamily,
      hintColor: darkLabelTertiary,
      toggleableActiveColor: customBlue,
      dividerTheme: DividerThemeData(
        color: darkSupportSeparator,
        thickness: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkBackSecondary,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide.none,
        ),
      ),
      iconTheme:
          IconThemeData(color: darkLabelTertiary, size: 24 * iconScaleFactor),
      appBarTheme: AppBarTheme(
        backgroundColor: darkBackPrimary,
        iconTheme: IconThemeData(
          color: darkLabelPrimary,
          size: 24 * iconScaleFactor,
        ),
        scrolledUnderElevation: 4,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: darkBackPrimary,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: customBlue,
        foregroundColor: customWhite,
        sizeConstraints: const BoxConstraints.tightFor(
              width: 56.0,
              height: 56.0,
            ) *
            floatingActionButtonScaleFactor,
        iconSize: 24 * iconScaleFactor,
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
        ),
        side: BorderSide(
          width: 2,
          color: darkSupportSeparator,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              color: customBlue,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 24 / 14,
              letterSpacing: 0.16,
            ),
          ),
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: darkLabelPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 32,
          height: 38 / 32,
        ),
        headline2: TextStyle(
          color: darkLabelPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 20,
          height: 32 / 20,
          letterSpacing: 0.5,
        ),
        headline3: TextStyle(
          color: darkLabelTertiary,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 16.41 / 14,
        ),
        headline4: TextStyle(
          color: darkLabelPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 18.75 / 16,
        ),
        bodyText1: TextStyle(
          color: darkLabelTertiary,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 20 / 16,
        ),
        bodyText2: TextStyle(
          color: darkLabelPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 20 / 16,
        ),
        subtitle1: TextStyle(
          color: darkLabelPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 18 / 16,
        ),
        subtitle2: TextStyle(
          color: darkLabelTertiary,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 20 / 14,
        ),
        button: TextStyle(
          color: darkLabelPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 16 * textScaleFactor,
          height: 1,
        ),
      ),
    );
  }
}
