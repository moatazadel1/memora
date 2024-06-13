import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memora/core/Firebase/firebase_functions.dart';
import 'package:memora/core/components/reusable_components.dart';
import 'package:memora/core/enums/enums.dart';
import 'package:memora/core/utilies/app_colors.dart';
import 'package:memora/features/mainScreen/presentation/pages/mainScreen.dart';
import 'package:memora/features/signUp/data/models/userDetailsModel.dart';
import 'package:memora/features/signUp/presentation/manager/sign_up_bloc.dart';
import '../../../Home/presentation/pages/home.dart';
import '../../../Login/presentation/widgets/field.dart';
import '../widgets/gender.dart';
import '../widgets/input.dart';
import '../widgets/mapContainer.dart';

class ImageManager {
  static final ImageManager _instance = ImageManager._internal();
  factory ImageManager() {
    return _instance;
  }
  ImageManager._internal();
  File? _image;
  File? get image => _image;
  set image(File? value) {
    _image = value;
  }
}

class Details extends StatefulWidget {
  Details({super.key, this.userUID});

  DateTime today = DateTime.now();

  Position? position;
  String? userUID;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  File? image;

  final imagePicker = ImagePicker();
  File? usedImage;
  ImageSource? source;
  DateTime selectedDate = DateTime.now();
  bool maleSwitch = false;
  bool fmaleSwitch = true;

  Future<void> chooseImage() async {
    var pickedImage = await imagePicker.pickImage(source: source!);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      setState(() {});
    } else {}
  }

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  Set<Marker> markers = <Marker>{};
  final Completer<GoogleMapController> mapcontroller =
      Completer<GoogleMapController>();
  var getData = FirebaseFunctions();

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<SignUpBloc>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 350.23.h,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Enter your loved ",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "One Details ",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 150.h,
              width: 150.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(75.r))),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(75.r)),
                  child: image != null
                      ? Image.file(
                          image!,
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          "assets/images/icon.png",
                          // width: 500,
                          // height: 500,
                          fit: BoxFit.cover,
                          color: AppColors.deepgrayColor,
                        )),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      source = ImageSource.camera;
                      chooseImage();
                    },
                    child: Container(
                      height: 47.h,
                      width: 47.w,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(35.r),
                          border: Border.all(color: AppColors.primaryColor)),
                      child: Icon(Icons.camera_alt_rounded,
                          size: 30.sp, color: AppColors.primaryColor),
                    )),
                SizedBox(
                  width: 40.w,
                ),
                InkWell(
                    onTap: () {
                      source = ImageSource.gallery;
                      chooseImage();
                    },
                    child: Container(
                      height: 47.h,
                      width: 47.w,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(35.r),
                          border: Border.all(color: AppColors.primaryColor)),
                      child: Icon(Icons.photo,
                          size: 30.sp, color: AppColors.primaryColor),
                    ))
              ],
            )
          ],
        ),
        backgroundColor: AppColors.blueColor,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(47.r),
                bottomLeft: Radius.circular(47.r)),
            borderSide: const BorderSide(color: Colors.transparent)),
      ),
      body: BlocConsumer<SignUpBloc, SignUpState>(
        bloc: bloc,
        listener: (context, state) async {
          if (state.locationstatus == LocationStatus.failure) {
            if (state.failures?.message == 'noPermission') {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        content: const Text('location permission is required'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Geolocator.openAppSettings();
                              },
                              child: const Text('Settings'))
                        ],
                      ));
            }
            if (state.failures?.message == 'noService') {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content:
                      const Text('location service is required to contenue'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Geolocator.openLocationSettings();
                        },
                        child: const Text('Settings'))
                  ],
                ),
              );
            }
          } else if (state.locationstatus == LocationStatus.success) {
            var position = state.location;
            widget.position = position;
            markers.add(Marker(
                markerId: const MarkerId('myPosition'),
                position: LatLng(position!.latitude, position.longitude)));

            final GoogleMapController controller = await mapcontroller.future;
            await controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 12)));
          }
          if (state.userstatus == RequestStatus.success) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainScreen(
                  // imagePreview: image,
                  userUID: state.credential!.user!.uid,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Field(
                    onClick: () {},
                    controller: name,
                    txt: "Full Name",
                    type: TextInputType.text,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Inputs(
                          txt: selectedDate.toString().substring(0, 10),
                          onClick: () async {
                            selectedDate = (await showDatePicker(
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                      primary: Colors.grey,
                                      onPrimary: AppColors
                                          .primaryColor, // header text color
                                    )),
                                    child: child!,
                                  );
                                },
                                context: context,
                                firstDate: DateTime(1730),
                                lastDate: DateTime.now(),
                                initialDate: selectedDate))!;
                          }),
                      Inputs(
                          txt: fmaleSwitch
                              ? " Female"
                              : maleSwitch
                                  ? " Male"
                                  : " Other",
                          onClick: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Column(
                                  children: [
                                    Gender(
                                        onChange: (value) {
                                          maleSwitch = value;
                                          fmaleSwitch = false;
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        usedswitch: maleSwitch,
                                        txt: "Male"),
                                    Gender(
                                        onChange: (value) {
                                          maleSwitch = false;
                                          fmaleSwitch = value;
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        usedswitch: fmaleSwitch,
                                        txt: "Female")
                                  ],
                                );
                              },
                            );
                          }),
                    ],
                  ),
                  Field(
                      onClick: () {},
                      controller: phone,
                      type: TextInputType.phone,
                      txt: "Phone Number"),
                  MapContainer(
                      mapcontroller: mapcontroller,
                      markers: markers,
                      onClick: () {
                        bloc.add(
                          const GetLocation(),
                        );
                      }),
                  useButton(
                      onClick: () {
                        var userModel = UserDetailsModel(
                            fullName: name.text,
                            date: selectedDate,
                            gender: fmaleSwitch ? "Female" : "Male",
                            phone: phone.text,
                            latitude:
                                widget.position?.latitude.toString() ?? "",
                            longitude:
                                widget.position?.longitude.toString() ?? "",
                            imgPath: image?.path ?? "");
                        bloc.add(StoreUser(
                            userModel: userModel, userUID: widget.userUID!));
                      },
                      txt: "Submit",
                      context: context,
                      bgcolor: AppColors.primaryColor,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400))
                ]),
          );
        },
      ),
    );
  }
}
