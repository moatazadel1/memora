import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memora/core/utilies/app_colors.dart';

class UsedBottomNavBar extends StatelessWidget {
  UsedBottomNavBar({super.key, required this.index, required this.onClick});
  int index;
  Function onClick;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.deepgrayColor,
        onTap: (value){
          onClick(value);
        },
        iconSize: 35.sp,
        type: BottomNavigationBarType.fixed,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.gamepad_outlined), label: "Game"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/ic_heart.png")),
              label: "Activities"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on), label: "Tracking"),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone), label: "Contacts"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/ic_profile.png")),
              label: "Profile"),
        ]);



  }
}