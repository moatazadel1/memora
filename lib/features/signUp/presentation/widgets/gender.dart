import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memora/core/utilies/app_colors.dart';

class Gender extends StatelessWidget {
   Gender({super.key,required this.onChange ,required this.usedswitch,required this.txt});
  bool usedswitch;
  Function onChange;
  String txt;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 20.w
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(txt,style: usedswitch?Theme.of(context).textTheme.bodyLarge:Theme.of(context).textTheme.bodyLarge!.copyWith(
             color: AppColors.deepgrayColor
           ),),
          Switch(value: usedswitch, onChanged: (value) {
            onChange(value);
          },
          activeTrackColor: AppColors.primaryColor,)
        ],
      ),
    );
  }
}
