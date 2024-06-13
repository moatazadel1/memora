
import 'dart:io';

import 'package:flutter/material.dart';

class ActivityDetailsModel {
  static const String collecionName="Activity Details";
  String? id;
  String? activityName;
  String? time;
  String? activityDesc;
  File? imgPath1;
  File? imgPath2;

  ActivityDetailsModel(
      {this.id="",required this.activityName, required this.time, required this.activityDesc,  this.imgPath1, this.imgPath2});
  ActivityDetailsModel.fromJson(Map<String, dynamic> json)
      : this(
      id: json["id"],
      imgPath1: json["imgPath1"],
      imgPath2: json["imgPath2"],
      activityName: json["activityName"],
      time: json["time"],
      activityDesc: json["activityDesc"]);
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "imgPath1":imgPath1,
      "activityDesc": activityDesc,
      "activityName": activityName,
      "imgPath2;": imgPath2,
      "time": time,
    };
  }
}
