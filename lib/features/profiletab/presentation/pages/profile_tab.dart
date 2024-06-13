import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:memora/config/routes/app_router.dart';
import 'package:memora/core/Firebase/firebase_functions.dart';
import 'package:memora/core/components/reusable_components.dart';
import 'package:memora/core/utilies/app_colors.dart';

class Profile extends StatefulWidget {
  Profile({super.key, this.userUID});

  String? userUID;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Set<Marker> markers = <Marker>{};
  var getdata = FirebaseFunctions();
  GoogleMapController? _controller;
  late LatLng _initialPosition; // Replace with your latitude and longitude

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  bool isValidDouble(String value) {
    final number = double.tryParse(value);
    return number != null;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getdata.getusers(widget.userUID!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Something Wrong."));
          }
          var data = snapshot.data?.docs.map((e) => e.data()).toList() ?? [];

          if (isValidDouble(data[0].latitude) &&
              isValidDouble(data[0].longitude)) {
            _initialPosition = LatLng(double.parse(data[0].latitude),
                double.parse(data[0].longitude));
          } else {
            print('Invalid latitude or longitude format');
            // Set a default position or handle the error appropriately
            _initialPosition = const LatLng(0.0, 0.0); // Default position
          }

          print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${data[0].latitude}");
          print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${data[0].latitude}");
          print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${widget.userUID}");
          print(">>>>>>>>>>>>>>>>>>${data.length}");

          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                toolbarHeight: 400.h,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(47),
                    // Adjust these values to change the curvature
                    bottomRight: Radius.circular(47),
                  ),
                ),
                backgroundColor: const Color(0xffD2EBE7),
                title: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Profile ",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        height: 150.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(75.r))),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(75.r)),
                            child: data[0].imgPath == ""
                                ? Image.asset(
                                    "assets/images/icon.png",
                                    // width: 500,
                                    // height: 500,
                                    fit: BoxFit.cover,
                                    color: AppColors.deepgrayColor,
                                  )
                                : Image.file(
                                    File(data[0].imgPath),
                                    fit: BoxFit.fill,
                                  )),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        data[0].userName,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Color(0XFF0B8FAC),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        data[0].phone,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF858585),
                        ),
                      )
                    ],
                  ),
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Home Location",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Color(0XFF000000),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 200.h,
                      width: double.infinity,
                      child: GoogleMap(
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target: _initialPosition,
                          zoom: 12,
                        ),
                        markers: {
                          Marker(
                            markerId: const MarkerId('marker_1'),
                            position: _initialPosition,
                          ),
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 65,
                    ),
                    useButton(
                        onClick: () {
                          FirebaseFunctions().signOut();
                          Navigator.pushNamedAndRemoveUntil(
                              context, AppRoutesName.auth, (route) => false);
                        },
                        txt: "Log out",
                        context: context,
                        bgcolor: AppColors.primaryColor,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400))
                  ],
                ),
              ));
        });
  }
}
