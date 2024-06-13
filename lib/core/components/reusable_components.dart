import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget useButton(
    {required Function onClick,
    required String txt,
    required BuildContext context,
    required Color bgcolor,
    required TextStyle? style}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          side: BorderSide.none,
          backgroundColor: bgcolor,

          // fixedSize: Size.fromHeight(60.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          )),
      onPressed: () {
        onClick();
      },
      child: Text(txt, style: style));
}
