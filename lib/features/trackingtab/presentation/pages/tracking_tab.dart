import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memora/core/utilies/app_colors.dart';
import 'package:memora/features/trackingtab/presentation/pages/card.dart';
import 'package:memora/features/trackingtab/presentation/pages/item.dart';

class TrackingTab extends StatefulWidget {
  const TrackingTab({super.key});

  @override
  _TrackingTabState createState() => _TrackingTabState();
}

class _TrackingTabState extends State<TrackingTab> {
  XFile? image;
  final bool _showNewCard = false;
  final ImagePicker _imagePicker = ImagePicker();
  TextEditingController notesController = TextEditingController();
  List<Item> itemList = [];
  Position? currentPosition;
  GoogleMapController? mapController;
  CameraPosition? initialCameraPosition;
  LatLng? currentLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView.builder(
        itemCount: (itemList.length / 2).ceil(), // Calculate the number of rows
        itemBuilder: (context, index) {
          int startIndex = index * 2;
          int endIndex = startIndex + 2 <= itemList.length
              ? startIndex + 2
              : itemList.length;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: endIndex - startIndex,
            itemBuilder: (context, i) {
              int currentIndex = startIndex + i;
              return Cardd(
                textt: itemList[currentIndex].textt,
                currentLocation: null, // Replace with your destination
                imgPath: itemList[currentIndex].imgPath,
                onDelete: () {
                  setState(() {
                    itemList.removeAt(currentIndex);
                  });
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'trackingTab',
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return _buildBottomSheet(context);
            },
          );
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      height: 1200.h, // Adjust the height as needed
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildImageSelectionWidget(),
          SizedBox(height: 8.h),
          SizedBox(
            height: 65.h, // Set the height of the TextField container
            child: TextField(
              controller: notesController,
              decoration: InputDecoration(
                hintText: 'Enter your notes',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
              ),
            ),
          ),
          SizedBox(height: 14.h),
          Expanded(
            child: FutureBuilder<Position>(
              future: _determinePosition(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  Position position = snapshot.data!;
                  LatLng currentPosition =
                      LatLng(position.latitude, position.longitude);
                  CameraPosition initialCameraPosition = CameraPosition(
                    target: currentPosition,
                    zoom: 16.0,
                  );
                  return _buildMapWidget(
                      initialCameraPosition, currentPosition);
                }
              },
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 40.h,
            child: ElevatedButton(
              onPressed: () {
                // Retrieve the entered notes

                // Create a new Item with the entered notes and image path
                Item newItem = Item(
                  textt: notesController.text,
                  imgPath: image!,
                );

                setState(() {
                  itemList.add(newItem); // Add the new item to the list
                });

                Navigator.pop(context); // Close the bottom sheet
              },
              child: Text('Submit',
                  style: TextStyle(color: AppColors.primaryColor)),
            ),
          ),
        ],
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Widget _buildImageSelectionWidget() {
    return Column(
      children: [
        Container(
          width: 120.w,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Colors.grey.withOpacity(0.3),
          ),
          child: image != null
              ? Image.file(File(image!.path), fit: BoxFit.cover)
              : Icon(Icons.image, size: 90.sp, color: Colors.grey),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                await _chooseImage(ImageSource.gallery);
              },
              icon: Icon(
                Icons.photo,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(width: 14.w),
            IconButton(
              onPressed: () async {
                await _chooseImage(ImageSource.camera);
              },
              icon: Icon(
                Icons.camera_alt,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _chooseImage(ImageSource source) async {
    final pickedImage = await _imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  Widget _buildMapWidget(
      CameraPosition initialCameraPosition, LatLng currentPosition) {
    return GoogleMap(
      onMapCreated: (controller) {
        setState(() {
          mapController = controller;
        });
      },
      initialCameraPosition: initialCameraPosition,
      markers: currentPosition != null ? _buildMarkers(currentPosition) : {},
    );
  }

  Set<Marker> _buildMarkers(LatLng currentPosition) {
    return {
      Marker(
        markerId: const MarkerId('currentLocation'),
        position: currentPosition,
      ),
    };
    return {};
  }
}
