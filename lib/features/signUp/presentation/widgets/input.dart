import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilies/app_colors.dart';
class Inputs extends StatelessWidget {
   Inputs({super.key,required this.txt,required this.onClick});

String txt;
Function onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(

        height: 57.2.h,
        width: 184.w,
        decoration: BoxDecoration(
          color: AppColors.grayColor,
          border: Border.all(
            color: AppColors.deepgrayColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5.r))
        ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(txt
              ,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.deepgrayColor,
                fontSize: 20.sp,

                fontWeight: FontWeight.w400),),
            Icon(Icons.keyboard_arrow_down)
          ],
        ) ,
      ),
    );
  }
}
