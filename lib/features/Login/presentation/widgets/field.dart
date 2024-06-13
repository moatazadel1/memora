import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilies/app_colors.dart';

class Field extends StatelessWidget {
 Field({super.key ,required this.onClick,required this.controller,required this.type,required this.txt,this. secure=false});

 Function onClick;
 TextEditingController controller=TextEditingController();
 TextInputType type;
 String txt;
 bool secure=false;

  @override
  Widget build(BuildContext context, ) {
    return SizedBox(
      height: 55.h,
      child: TextFormField(
        obscureText: secure,
        textAlign: TextAlign.left,
        controller: controller,
        validator: (value) {
          onClick(value);
        },

        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.deepgrayColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400),
        enabled: true,
        keyboardType: type,
        decoration: InputDecoration(

            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.deepgrayColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(color: AppColors.deepgrayColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(color: AppColors.deepgrayColor)),
            hintText: txt,
            fillColor: AppColors.grayColor,
            filled: true),

      ),
    );
  }
}
