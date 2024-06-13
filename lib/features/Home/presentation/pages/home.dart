import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memora/core/utilies/app_colors.dart';
import '../../../../core/Firebase/firebase_functions.dart';

class Home extends StatefulWidget {
  final File? imagePreview;
  final String? userUID;

  const Home({Key? key, this.imagePreview, this.userUID}) : super(key: key);

  @override
  State<Home> createState() => _HomeState(imagePreview: imagePreview);
}

class _HomeState extends State<Home> {
  int index = 0;
  File? imagePreview;
  var getdata = FirebaseFunctions();

  _HomeState({this.imagePreview});

  List<String> images = [
    '🍎',
    '🍎',
    '🍌',
    '🍌',
    '🍊',
    '🍊',
    '🍉',
    '🍉',
    '🍇',
    '🍇',
    '🍓',
    '🍓',
    '🍒',
    '🍒',
    '🍍',
    '🍍',
    '🍏',
    '🍏',
  ];

  late List<String> visibleImages;
  late List<bool> flipped;
  late int previousIndex;
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    visibleImages = images.toList()..shuffle();
    flipped = List<bool>.filled(images.length, false);
    previousIndex = -1;
  }

  void resetGame() {
    setState(() {
      startGame();
    });
  }

  void updateImagePreview(File newImage) {
    setState(() {
      imagePreview = newImage;
    });
  }

  void flipCard(int index) {
    if (isProcessing || flipped[index]) return;

    setState(() {
      flipped[index] = true;
    });

    if (previousIndex == -1) {
      previousIndex = index;
    } else {
      if (visibleImages[previousIndex] != visibleImages[index]) {
        isProcessing = true;
        Timer(const Duration(milliseconds: 1000), () {
          setState(() {
            flipped[previousIndex] = false;
            flipped[index] = false;
            previousIndex = -1;
            isProcessing = false;
          });
        });
      } else {
        previousIndex = -1;
        if (flipped.every((element) => element)) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Good Job!'),
                content: const Text('You won the game!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      resetGame();
                    },
                    child: const Text('Play Again'),
                  ),
                ],
              );
            },
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Ensure that userUID is not null
    if (widget.userUID == null) {
      return const Scaffold(
        body: Center(child: Text("User ID is missing")),
      );
    }

    return StreamBuilder(
      stream: getdata.getusers(widget.userUID ?? ""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong: ${snapshot.error}"));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No user data found."));
        }
        var data = snapshot.data?.docs.map((e) => e.data()).toList() ?? [];

        return Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: AppColors.blueColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  left: 27,
                  top: 76,
                  bottom: 20,
                  child: Row(
                    children: [
                      Container(
                        width: 90.w,
                        height: 90.h,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.r)),
                        ),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.r)),
                          child: data.isNotEmpty && data[0].imgPath != ""
                              ? Image.file(
                                  File(data[0].imgPath),
                                  fit: BoxFit.fill,
                                )
                              : Image.asset(
                                  "assets/images/icon.png",
                                  fit: BoxFit.cover,
                                  color: AppColors.deepgrayColor,
                                ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        "Hi, welcome back... ${data[0].fullName}",
                        style: TextStyle(
                          color: AppColors.deepgrayColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Container(
                width: 382.w,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        flipCard(index);
                      },
                      child: SizedBox(
                        width: 25.w,
                        height: 25.h,
                        child: Card(
                          color: flipped[index]
                              ? Colors.white
                              : AppColors.primaryColor,
                          child: Center(
                            child: Text(
                              flipped[index] ? visibleImages[index] : '',
                              style: const TextStyle(fontSize: 50),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
