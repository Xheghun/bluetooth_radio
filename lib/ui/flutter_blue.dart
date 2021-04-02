import 'package:bluetooth_scanner/res/color.dart';
import 'package:bluetooth_scanner/ui/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BluetoothRadio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        accentColor: Colors.black,
        primaryColor: colorPrimary,
        primaryColorDark: colorPrimaryDark,
        primaryColorLight: colorPrimaryLight,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: HomeScreen(),
    );
  }
}
