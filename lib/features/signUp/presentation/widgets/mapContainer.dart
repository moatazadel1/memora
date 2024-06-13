
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:memora/core/utilies/app_colors.dart';

class MapContainer extends StatelessWidget {
   MapContainer({super.key,required this.onClick,required this.mapcontroller,required this.markers});
  final Completer<GoogleMapController> mapcontroller ;

  static  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
   Set<Marker> markers =  <Marker>{};

  Function onClick;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 173.h,
      width:377.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.deepgrayColor
        )
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          GoogleMap(
            markers: markers,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              mapcontroller.complete(controller);
            },
          ),
         InkWell(
            onTap: () {
              onClick();
            },
           child: Container(
             width: 50.w,
             height: 50.h,
             decoration: BoxDecoration(
               color: Colors.white,
             borderRadius: BorderRadius.all(Radius.circular(50.r))
             ),
             child: Icon(Icons.my_location,color: Colors.redAccent,),
           ),
         )
        ],
      ),
    );
  }
}
