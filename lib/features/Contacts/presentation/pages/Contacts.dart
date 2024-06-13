import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memora/core/utilies/app_colors.dart';
import '../../data/model/contactsModel.dart';
import 'card2.dart';
import 'item2.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  XFile? image;

  final bool _showNewCard = false;

  final ImagePicker _imagePicker = ImagePicker();

  TextEditingController nameController = TextEditingController();

  List<Itemm> itemList = [];

  TextEditingController numberController = TextEditingController();

  TextEditingController relationController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView.builder(
        itemCount: (itemList.length / 2).ceil(),
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
              return Card2(
                relation: itemList[currentIndex].relation,
                imgPathh: itemList[currentIndex].imgPathh,
                nametext: itemList[currentIndex].nametext,
                numbertext: itemList[currentIndex].numbertext,
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
        heroTag: 'contacts',
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SingleChildScrollView(child: _buildBottomSheet(context));
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
      height: MediaQuery.of(context).size.height * .9,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildImageSelectionWidget(),
          SizedBox(height: 8.h),
          Column(
            children: [
              SizedBox(
                height: 60.h,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter name',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 60.h,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: numberController,
                  decoration: InputDecoration(
                    hintText: 'Enter phone number',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 60.h,
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: relationController,
                  decoration: InputDecoration(
                    hintText: 'Enter relation',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 40.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor),
              onPressed: () {
                Itemm newItem = Itemm(
                  nametext: nameController.text,
                  numbertext: numberController.text,
                  relation: relationController.text,
                  imgPathh: image!,
                );

                setState(() {
                  itemList.add(newItem);
                });

                Navigator.pop(context);
              },
              child:
                  const Text('Submit', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSelectionWidget() {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Colors.grey.withOpacity(0.3),
          ),
          child: image != null
              ? Image.file(File(image!.path), fit: BoxFit.cover)
              : const Icon(Icons.image, size: 90, color: Colors.grey),
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
            const SizedBox(width: 14),
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
}
