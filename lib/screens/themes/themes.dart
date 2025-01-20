import 'package:code_smells_datasets_visualizer/screens/themes/colors.dart';
import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
        // fontFamily: "Poppins",
        // fontFamilyFallback: const [
        //   "Cairo",
        // ],
        )
    .copyWith(
  primaryColor: lightTheme.primaryColor,
  dividerColor: lightTheme.dividerColor,
  radioTheme: lightTheme.radioTheme,
  scaffoldBackgroundColor: lightTheme.scaffoldBackgroundColor,
  progressIndicatorTheme: lightTheme.progressIndicatorTheme,
  textSelectionTheme: lightTheme.textSelectionTheme,
  textButtonTheme: lightTheme.textButtonTheme,
  inputDecorationTheme: lightTheme.inputDecorationTheme,
);

ThemeData lightTheme = ThemeData.light(
  useMaterial3: true,
).copyWith(
  primaryColor: CSDVColors.primaryColor,
  dividerColor: const Color(0xFFE9F0FD),
  scaffoldBackgroundColor: CSDVColors.greyishColor,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: CSDVColors.primaryColor,
    selectionColor: CSDVColors.primaryColor.withOpacity(.3),
    selectionHandleColor: CSDVColors.primaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding:
        const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.0,
        color: CSDVColors.greyColor,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.0,
        color: CSDVColors.greyColor,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.0,
        color: CSDVColors.primaryColor,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.0,
        color: CSDVColors.greyColor,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.0,
        color: CSDVColors.primaryColor,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    filled: true,
    fillColor: CSDVColors.greyishColor,
    hintStyle: TextStyle(
      color: CSDVColors.greyColor,
      fontWeight: FontWeight.w300,
    ),
  ),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.all<Color>(
      CSDVColors.primaryColor,
    ),
    overlayColor: WidgetStateProperty.all<Color>(
      CSDVColors.primaryColor,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsetsDirectional>(
        const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
      ),
      backgroundColor: WidgetStateProperty.all<Color>(
        CSDVColors.primaryColor.withOpacity(1),
      ),
      foregroundColor: WidgetStateProperty.all<Color>(
        CSDVColors.primaryColor.withOpacity(1),
      ),
      fixedSize: WidgetStateProperty.all<Size>(
        const Size(150, 50),
      ),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      textStyle: WidgetStateProperty.all<TextStyle>(
        TextStyle(
          // fontFamily: "Poppins",
          // fontFamilyFallback: const [
          //   "Cairo",
          // ],
          fontSize: 18,
          color: CSDVColors.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: CSDVColors.primaryColor,
  ),
);
