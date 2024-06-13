import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memora/core/utilies/app_colors.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


import 'dart:io';
import 'package:geocoding/geocoding.dart';

class Card2 extends StatelessWidget {
  final XFile? imgPathh;
  final String relation;
  final String nametext;
  final String numbertext;
  final Function()? onDelete;

  Card2({
    required this.relation,
    required this.nametext,
    required this.imgPathh,
    required this.numbertext,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: Card(
        shadowColor: AppColors.primaryColor,
        elevation: 1,
        color: Colors.white,
        margin: const EdgeInsets.all(11),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  SizedBox(
                    height: 81.7.h,
                    width: 180.w,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      child: imgPathh != null
                          ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(File(imgPathh!.path), fit: BoxFit.cover))
                          : Icon(Icons.image, size: 90, color: Colors.grey),
                    ),
                  ),
                  IconButton(
                    onPressed: onDelete,
                    icon: Icon(Icons.delete_outline, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                 relation,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  nametext,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height:2.h),
              ElevatedButton(
                onPressed: ()async {
FlutterPhoneDirectCaller.callNumber(numbertext);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                ),
                child: Text(
                  "call",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}