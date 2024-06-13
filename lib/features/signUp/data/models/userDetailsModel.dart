
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetailsModel{
  static const String collectionName="Users";
  String fullName;
  DateTime? date;
  String? gender;
  String phone;
  String imgPath;
  String latitude;
  String longitude;


  UserDetailsModel({this.fullName="", this.date,this.gender, this.phone="",  this.latitude="", this.longitude="",this.imgPath=""});
  UserDetailsModel.fromJson(Map<String,dynamic> json):this(

      imgPath: json["imgPath"],
      fullName: json["fullName"],
      date: (json['date'] as Timestamp?)?.toDate(),
      gender: json["gender"],
      phone: json["phone"],
      latitude: json["latitude"],
      longitude:json["longitude"]

  );
  Map<String,dynamic> toJson(){
    return {
      "imgPath":imgPath,
      "fullName": fullName,
      "date": date,
      "gender": gender,
      "phone": phone,
      "longitude":longitude,
      "latitude":latitude
    };
  }
}