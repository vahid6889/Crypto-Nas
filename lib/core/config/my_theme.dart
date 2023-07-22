import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    textTheme: TextTheme(
      titleLarge: GoogleFonts.ubuntu(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      bodySmall: GoogleFonts.ubuntu(color: Colors.white60, fontSize: 15),
      labelSmall: GoogleFonts.ubuntu(color: Colors.white54, fontSize: 13),
      titleSmall: GoogleFonts.ubuntu(color: Colors.black, fontSize: 12),
      headlineLarge: const TextStyle(
        color: Colors.white54,
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: const TextStyle(
        color: Colors.white54,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: const TextStyle(
        color: Colors.white,
        fontSize: 22,
      ),
      displaySmall: const TextStyle(
        color: Colors.white54,
        fontSize: 16,
      ),
    ),
    unselectedWidgetColor: Colors.white70,
    primaryColorLight: Colors.black,
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.blueAccent[700],
    secondaryHeaderColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black, opacity: 0.8),
    dialogBackgroundColor: const Color.fromARGB(255, 47, 47, 52),
    dividerColor: Colors.white54,
    splashColor: const Color.fromARGB(255, 47, 47, 52),
    focusColor: Colors.white54,
    canvasColor: Colors.white54,
    hintColor: const Color(0xFF4B4B4C),
    fontFamily: "Vazir",
    // colorScheme:
    //     const ColorScheme.light(onSecondary: Color.fromARGB(255, 47, 47, 52)),

    // textSelectionTheme: const TextSelectionThemeData(
    //   cursorColor: Colors.red,
    //   selectionColor: Colors.green,
    //   selectionHandleColor: Colors.blue,
    // )
    // colorScheme: const ColorScheme.dark()
  );

  static final lightTheme = ThemeData(
    textTheme: TextTheme(
      titleLarge: GoogleFonts.ubuntu(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      bodySmall: GoogleFonts.ubuntu(color: Colors.black54, fontSize: 15),
      labelSmall: GoogleFonts.ubuntu(color: Colors.black54, fontSize: 13),
      titleSmall: GoogleFonts.ubuntu(color: Colors.black, fontSize: 12),
      headlineLarge: const TextStyle(
        color: Colors.black54,
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: const TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: const TextStyle(
        color: Colors.black54,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: const TextStyle(
        color: Colors.white,
        fontSize: 22,
      ),
      displaySmall: const TextStyle(
        color: Colors.black54,
        fontSize: 16,
      ),
    ),
    unselectedWidgetColor: Colors.black,
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blueAccent,
    secondaryHeaderColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
    highlightColor: Colors.black54,
    dialogBackgroundColor: const Color(0xFFCBC8E5),
    dividerColor: Colors.black54,
    splashColor: Colors.white,
    focusColor: Colors.black54,
    canvasColor: Colors.black54,
    hintColor: const Color(0xFF011C4B),
    fontFamily: "Vazir",
  );
}
