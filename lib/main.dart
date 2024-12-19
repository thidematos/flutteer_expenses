import 'package:flutter/material.dart';
import 'package:flutter_expenses/tracker.dart';
import 'package:google_fonts/google_fonts.dart';

final ColorScheme kColorTheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 34, 89));

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorTheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorTheme.onPrimaryContainer,
          foregroundColor: kColorTheme.onTertiary,
        ),
        textTheme: const TextTheme().copyWith(
          bodyMedium: GoogleFonts.montserrat(
            fontSize: 16,
            color: const Color.fromARGB(255, 48, 48, 48),
          ),
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorTheme.onPrimaryContainer,
        ),
      ),
      home: const Tracker(),
    ),
  );
}
