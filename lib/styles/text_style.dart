import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextHD {
  static TextStyle appbarTitle = GoogleFonts.elMessiri(
    fontSize: 34,
    color: Colors.black,
    fontWeight: FontWeight.bold
  );
  static TextStyle searchbar = GoogleFonts.lato(
    fontSize: 14,
  );
  static TextStyle cardTitle = GoogleFonts.lato(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  static TextStyle cardLivello = GoogleFonts.lato(
    color: Colors.black87,
    fontWeight: FontWeight.bold
  );
  static TextStyle cardDurata = const TextStyle(
    fontSize: 12,
    color: Colors.black87,
  );
  static TextStyle tutorialDescr = GoogleFonts.lato(
    fontSize: 14,
    color: Colors.black,
  );
  static TextStyle noResult = GoogleFonts.lato(
    fontSize: 16,
    color: Colors.black,
  );
  static TextStyle noResultTitle = GoogleFonts.lato(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold
  );
  static TextStyle tutorialCompleted = GoogleFonts.lato(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: Colors.grey[600],
  );
}
