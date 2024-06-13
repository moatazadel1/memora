import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memora/core/utilies/app_colors.dart';
import 'mapScreen.dart';
import 'dart:io';
import 'package:geocoding/geocoding.dart';

class Cardd extends StatelessWidget {
  final XFile? imgPath;
  final String textt;
  final Function()? onDelete;
  final LatLng? currentLocation;

  Cardd({
    required this.textt,
    required this.currentLocation,
    required this.imgPath,
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
        margin:  EdgeInsets.all(11.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(6.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  SizedBox(
                    height: 90.h,
                    width: 180.w,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      child: imgPath != null
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(10), // assuming the image is 120x120
                        child: Image.file(
                          File(imgPath!.path),
                          fit: BoxFit.cover,
                        ),
                      )
                          : Icon(Icons.image, size: 90, color: Colors.grey),
                    ),
                  ),
                  IconButton(
                    onPressed: onDelete,
                    icon: Icon(Icons.delete_outline, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 5.5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  textt,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 5.h),
              ElevatedButton(
                onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapScreen(),
                        ),
                      );
                    },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: AppColors.primaryColor,
                ),
                child: Text(
                  "Navigate",
                  style: TextStyle(color: Colors.white,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}