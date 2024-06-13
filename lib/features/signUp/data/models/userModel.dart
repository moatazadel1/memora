import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  static const String collectionName="Users";
  String id;
  String? email;
  String userName;
  String fullName;
  DateTime? date;
  String? gender;
  String phone;
  String imgPath;
  String latitude;
  String longitude;


  UserModel({this.id="", this.email,this.userName="",this.fullName="", this.date,this.gender, this.phone="",  this.latitude="", this.longitude="",this.imgPath=""});
  UserModel.fromJson(Map<String,dynamic> json):this(
      id:json['id'],
      email:json['email'],
      userName:json['userName'],
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
      'id':id,
      'email':email,
      'userName':userName,
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