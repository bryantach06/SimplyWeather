import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kTempTextStyle = GoogleFonts.quicksand(
  fontSize: 90.0,
);

var kMessageTextStyle = GoogleFonts.quicksand(
  fontSize: 30.0,
  fontWeight: FontWeight.w700,
);

var kButtonTextStyle = GoogleFonts.quicksand(
  fontSize: 30.0,
);

var kConditionTextStyle = GoogleFonts.quicksand(
  fontSize: 100.0,
);

var kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.grey[300],
  icon: const Icon(Icons.location_city),
  iconColor: Colors.black54,
  hintText: 'Enter City Name',
  hintStyle: const TextStyle(color: Colors.grey),
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
);
