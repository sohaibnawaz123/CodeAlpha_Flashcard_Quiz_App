import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appHeading(
  {
    required double size,
   required Color color,
    FontWeight? weight 
  }
) {
  return GoogleFonts.redRose(
    fontSize: size,
    color: color,
    
    fontWeight: weight
  );
}
TextStyle appText(
  {
   required double size,
   required Color color,
    FontWeight? weight 
  }
) {
  return GoogleFonts.poppins(
    fontSize: size,
    color: color,
    fontWeight: weight
  );
}
