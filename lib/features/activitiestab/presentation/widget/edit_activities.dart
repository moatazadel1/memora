import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memora/core/Firebase/firebase_functions.dart';
import 'package:memora/features/activitiestab/data/model/activityModel.dart';

class EditActivities extends StatefulWidget {
  static const String routeName = "edit_activities";

  const EditActivities({super.key});

  @override
  State<EditActivities> createState() => _EditActivitiesState();
}

class _EditActivitiesState extends State<EditActivities> {
  File? image1;
  File? image2;

  final imagePicker = ImagePicker();

  var activityController = TextEditingController();
  var descriptionController = TextEditingController();
  TimeOfDay selectedtime = TimeOfDay.now();

  Future<XFile?> chooseImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      return pickedImage;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Edit Activities",
          style: TextStyle(
            color: Color(0xFF0B8FAC),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            TextFormField(
              controller: activityController,
              decoration: InputDecoration(
                label: const Text(
                  "Activity name",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0B8FAC),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                label: const Text(
                  "Activity description",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0B8FAC),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            // const SizedBox(height: 15),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Expanded(
            //       child: InkWell(
            //         onTap: () async {
            //           var pickedImage = await chooseImage();
            //           if (pickedImage != null) {
            //             setState(() {
            //               image1 = File(pickedImage.path);
            //             });
            //           }
            //         },
            //         child: Container(
            //           child: image1 != null
            //               ? Image.file(image1!, fit: BoxFit.fill)
            //               : Icon(
            //                   Icons.add_a_photo,
            //                   color: Color(0xFF0B8FAC),
            //                   size: 30,
            //                 ),
            //           width: 179,
            //           height: 163,
            //           decoration: BoxDecoration(
            //             color: Colors.grey[200],
            //             borderRadius: BorderRadius.circular(12),
            //             shape: BoxShape.rectangle,
            //           ),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(width: 10),
            //     Expanded(
            //       child: InkWell(
            //         onTap: () async {
            //           var pickedImage = await chooseImage();
            //           if (pickedImage != null) {
            //             setState(() {
            //               image2 = File(pickedImage.path);
            //             });
            //           }
            //         },
            //         child: Container(
            //           child: image2 != null
            //               ? Image.file(image2!, fit: BoxFit.fill)
            //               : Icon(
            //                   Icons.add_a_photo,
            //                   color: Color(0xFF0B8FAC),
            //                   size: 30,
            //                 ),
            //           width: 179,
            //           height: 163,
            //           decoration: BoxDecoration(
            //             color: Colors.grey[200],
            //             borderRadius: BorderRadius.circular(12),
            //             shape: BoxShape.rectangle,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Select Time",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            InkWell(
              onTap: () async {
                var time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    selectedtime = time;
                  });
                }
              },
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  selectedtime.format(context),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w100),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Reminder Type",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0B8FAC),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 54,
                  height: 54,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0B8FAC),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.access_alarm_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                FirebaseFunctions().addActivity(
                  ActivityDetailsModel(
                    activityName: activityController.text,
                    time: selectedtime.toString(),
                    activityDesc: descriptionController.text,
                    imgPath1: image1,
                    imgPath2: image2,
                  ),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0B8FAC),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
              child: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
