import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:memora/core/utilies/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/Firebase/firebase_functions.dart';
import '../../data/model/trackingModel.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controllerCompleter = Completer();
  Set<Marker> _markers = {};
  LatLng? _blueMarkerLatLng;
  LatLng? _yellowMarkerLatLng;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMapWidget(
              onMapCreated: (GoogleMapController controller) {
                _controllerCompleter.complete(controller);
              },
              markers: _markers,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _locateButtonPressed,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primaryColor),
                  child: Text('Locate me '),
                ),
                ElevatedButton(
                  onPressed: _saveLocationButtonPressed,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white),
                  child: Text('Locate saved place'),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: _navigateButtonPressed,
                    icon: Icon(Icons.navigation),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _locateButtonPressed() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      LatLng currentLatLng = LatLng(position.latitude, position.longitude);
      setState(() {
        _markers = {
          Marker(
            markerId: MarkerId('currentLocation'),
            position: currentLatLng,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          ),
        };
        _blueMarkerLatLng = currentLatLng;
      });
      GoogleMapController controller = await _controllerCompleter.future;
      controller.animateCamera(CameraUpdate.newLatLng(currentLatLng));
    } catch (e) {
      print('Error locating: $e');
    }
  }

  Future<void> _saveLocationButtonPressed() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      LatLng currentLatLng = LatLng(position.latitude, position.longitude);

      // Create a TrackingModel instance with the current location's latitude and longitude
      TrackingModel trackingModel = TrackingModel(
        id: '',
        latitude: currentLatLng.latitude.toString(),
        longitude: currentLatLng.longitude.toString(),
      );

      // Call the saveLocation function and pass the TrackingModel instance as an argument
      await saveLocation(trackingModel);

      // Add a yellow marker to the map to indicate the saved location
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId('savedLocation_${_markers.length}'),
            position: currentLatLng,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueYellow),
          ),
        );
        _yellowMarkerLatLng = currentLatLng;
      });
    } catch (e) {
      print('Error saving location: $e');
    }
  }

  void _navigateButtonPressed() async {
    if (_blueMarkerLatLng != null && _yellowMarkerLatLng != null) {
      final String googleMapsUrl =
          "https://www.google.com/maps/dir/?api=1&origin=${_blueMarkerLatLng!.latitude},${_blueMarkerLatLng!.longitude}&destination=${_yellowMarkerLatLng!.latitude},${_yellowMarkerLatLng!.longitude}&travelmode=driving";
      if (await canLaunch(googleMapsUrl)) {
        await launch(googleMapsUrl);
      } else {
        throw 'Could not launch $googleMapsUrl';
      }
    }
  }
}

class GoogleMapWidget extends StatelessWidget {
  final Function(GoogleMapController) onMapCreated;
  final Set<Marker> markers;

  const GoogleMapWidget({required this.onMapCreated, required this.markers});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: onMapCreated,
      markers: markers,
      initialCameraPosition: CameraPosition(
        target: LatLng(30.0444, 31.2357),
        zoom: 10,
      ),
    );
  }
}
