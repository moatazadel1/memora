import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memora/core/utilies/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../../core/Firebase/firebase_functions.dart';

class Home extends StatelessWidget {
  final File? imagePreview;
  final String? userUID;

  const Home({Key? key, this.imagePreview, this.userUID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameState(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              UserInfoSection(userUID: userUID),
              SizedBox(height: 20.h),
              const Expanded(child: GameGrid()),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfoSection extends StatelessWidget {
  final String? userUID;

  const UserInfoSection({Key? key, this.userUID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getdata = FirebaseFunctions();

    return StreamBuilder(
      stream: getdata.getusers(userUID ?? ""),
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

        return Stack(
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
                      borderRadius: BorderRadius.all(Radius.circular(100.r)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100.r)),
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
        );
      },
    );
  }
}

class GameGrid extends StatelessWidget {
  const GameGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameState>(
      builder: (context, gameState, child) {
        return Container(
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
            itemCount: gameState.images.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  gameState.flipCard(index, context);
                },
                child: SizedBox(
                  width: 25.w,
                  height: 25.h,
                  child: Card(
                    color: gameState.flipped[index]
                        ? Colors.white
                        : AppColors.primaryColor,
                    child: Center(
                      child: Text(
                        gameState.flipped[index]
                            ? gameState.visibleImages[index]
                            : '',
                        style: const TextStyle(fontSize: 50),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class GameState extends ChangeNotifier {
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
  int previousIndex = -1;
  bool isProcessing = false;

  GameState() {
    startGame();
  }

  void startGame() {
    visibleImages = images.toList()..shuffle();
    flipped = List<bool>.filled(images.length, false);
    previousIndex = -1;
    notifyListeners();
  }

  void resetGame(BuildContext context) {
    startGame();
    Navigator.of(context).pop();
  }

  void flipCard(int index, BuildContext context) {
    if (isProcessing || flipped[index]) return;

    flipped[index] = true;
    notifyListeners();

    if (previousIndex == -1) {
      previousIndex = index;
    } else {
      if (visibleImages[previousIndex] != visibleImages[index]) {
        isProcessing = true;
        notifyListeners();
        Future.delayed(const Duration(milliseconds: 1000), () {
          flipped[previousIndex] = false;
          flipped[index] = false;
          previousIndex = -1;
          isProcessing = false;
          notifyListeners();
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
                    onPressed: () => resetGame(context),
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
}
