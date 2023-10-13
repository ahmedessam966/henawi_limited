import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConstants with ChangeNotifier {
  ThemeData get lightThemeData {
    return ThemeData(
      useMaterial3: true,
      dialogTheme: DialogTheme(backgroundColor: const Color(0xaafffcfb).withOpacity(0.95), elevation: 5),
      fontFamily: 'ubuntu',
      brightness: Brightness.light,
      iconTheme: const IconThemeData(color: Colors.black, size: 35),
      cardTheme: CardTheme(
        margin: const EdgeInsets.all(10),
        color: const Color(0xaaf7f6ed).withOpacity(1),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      scaffoldBackgroundColor: const Color(0xaad3d7de).withOpacity(1),

      ////////////////////////////////////////////////////////////////////////////////////////////////////////

      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        displayMedium: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        displaySmall:
            TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500), //Regular Style

        labelSmall:
            TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.w500), //Active Color Text

        labelMedium:
            TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500), //Button Text Style
        bodyLarge: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),

        labelLarge:
            TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500), //Denied Color Text

        headlineSmall:
            TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500), //TextFormField Label

        headlineMedium: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500), //Rounded Action Button Labels

        headlineLarge: TextStyle(
            color: Colors.cyan, fontSize: 16, fontWeight: FontWeight.w500), //Selected Nav Bar Tab Labels

        bodySmall: TextStyle(color: Colors.black, fontSize: 16, fontStyle: FontStyle.italic), //Italic Regular
        bodyMedium: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
      ),

      ////////////////////////////////////////////////////////////////////////////////////////////////////////

      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: Colors.black,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: const Color(0xaa445172).withOpacity(1)),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.black)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.red)),
      ),

      ////////////////////////////////////////////////////////////////////////////////////////////////////////

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            enableFeedback: true,
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            overlayColor: MaterialStateProperty.all(const Color(0xaae3e2df).withOpacity(1))),
      ),

      ////////////////////////////////////////////////////////////////////////////////////////////////////////

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            enableFeedback: true,
            iconColor: MaterialStateProperty.all(Colors.white),
            iconSize: MaterialStateProperty.all(20),
            overlayColor: MaterialStateProperty.all(const Color(0xaae3e2df).withOpacity(0.2)),
            backgroundColor: MaterialStateProperty.all(const Color(0xaa384358).withOpacity(1)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
      ),

      drawerTheme: DrawerThemeData(
        backgroundColor: const Color(0xaaf0f2ec).withOpacity(1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        ),
        width: 500,
        surfaceTintColor: Colors.black,
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ThemeData get darkThemeData {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        displayMedium: GoogleFonts.ubuntu(color: Colors.white, fontSize: 16),
      ),
      scaffoldBackgroundColor: const Color(0xaa05161a).withOpacity(1),
    );
  }
}
