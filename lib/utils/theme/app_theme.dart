import 'package:flutter/material.dart';
import '../utils.dart';

import 'app_colors.dart';

final ThemeData appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: primaryColor,
  );
  final ThemeData base = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    accentColorBrightness: Brightness.light,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    buttonColor: primaryColor,
    accentColor: primaryColor,
    canvasColor: whiteColor,
    scaffoldBackgroundColor: whiteColor,
    backgroundColor: whiteColor,
    errorColor: errorColor,
    disabledColor: disableColor,
    focusColor: focusColor,
    secondaryHeaderColor: primaryColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: lightColor,
      iconTheme: IconThemeData(color: darkGrey),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: darkGrey,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.primary,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(color: focusColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: errorColor, width: 2.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: errorColor, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: primaryColor, width: 2.w),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(color: focusColor),
      ),
      hintStyle: TextStyle(
        fontSize: 16.sp,
        fontFamily: "ProductSans",
        fontWeight: FontWeight.w400,
        color: darkGrey,
      ),
    ),
    buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        height: 46.h,
        buttonColor: primaryColor,
        disabledColor: disableColor),
  );
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme, color: darkGrey),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme, color: whiteColor),
    accentTextTheme: _buildTextTheme(base.accentTextTheme, color: whiteColor),
  );
}

TextTheme _buildTextTheme(TextTheme base, {Color? color}) {
  return base
      .copyWith(
        headline1: base.headline1!
            .copyWith(fontSize: 56.sp, fontWeight: FontWeight.w400),
        headline2: base.headline2!
            .copyWith(fontSize: 48.sp, fontWeight: FontWeight.w400),
        headline3: base.headline3!
            .copyWith(fontWeight: FontWeight.w400, fontSize: 40.sp),
        headline4: base.headline4!
            .copyWith(fontWeight: FontWeight.w600, fontSize: 32.sp),
        headline5: base.headline5!
            .copyWith(fontWeight: FontWeight.w600, fontSize: 24.sp),
        headline6: base.headline6!
            .copyWith(fontSize: 20.0.sp, fontWeight: FontWeight.w600),
        subtitle1: base.subtitle1!.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        subtitle2: base.subtitle2!.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 10.0.sp,
        ),
        bodyText2: base.bodyText2!.copyWith(
          fontSize: 14.0.sp,
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontSize: 16.0.sp,
        ),
        button: base.button!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0.sp,
        ),
      )
      .apply(
          fontFamily: 'ProductSans',
          bodyColor: color,
          displayColor: color);
}
