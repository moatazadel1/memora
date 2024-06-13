import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static ThemeData getLightTheme() {
    return ThemeData(
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.openSans(
              color: AppColors.primaryColor,
              fontSize: 26.sp,
              fontWeight: FontWeight.w700
          ),
          bodyMedium: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600
          ),
          bodySmall: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600
          ),
          displaySmall:  GoogleFonts.openSans(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            color: AppColors.grayColor
          ),
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            // iconTheme: IconThemeData(
            //     color: Colors.white,
            //     size: 30
            // )
        )
    );
  }
}