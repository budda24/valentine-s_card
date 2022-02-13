import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kTextStyleWhiteShadow = TextStyle(
  fontSize: 26,
  color: Colors.black,
  shadows: <Shadow>[
    Shadow(
      offset: Offset(5.0, 5.0),
      blurRadius: 3.0,
      color: Color(0xffF2918C),
    ),
    Shadow(
      offset: Offset(5.0, 5.0),
      blurRadius: 8.0,
      color: Color(0xffBE1344),
    ),
  ]
);
const kTextStyleWhite = TextStyle(
    fontSize: 36,
    fontFamily: 'Quicksand',
    color: Colors.white,
);
