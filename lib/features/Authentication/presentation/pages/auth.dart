import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memora/config/routes/app_router.dart';
import 'package:memora/core/components/reusable_components.dart';
import 'package:memora/core/utilies/app_colors.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(flex: 1),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Tell us",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.blackColor),
                ),
                Text(
                  "Who are you",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1.h,
            ),
            useButton(
                onClick: () {
                  Navigator.pushNamed(context, AppRoutesName.detection);
                },
                txt: "Detection",
                context: context,
                bgcolor: AppColors.grayColor,
                style: Theme.of(context).textTheme.bodySmall),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02.h,
            ),
            useButton(
                onClick: () {
                  Navigator.pushNamed(context, AppRoutesName.login);
                },
                txt: "Login as Patient",
                context: context,
                bgcolor: AppColors.grayColor,
                style: Theme.of(context).textTheme.bodySmall),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02.h,
            ),
            useButton(
                onClick: () {
                  Navigator.pushNamed(context, AppRoutesName.news);
                },
                txt: "Alzheimer News",
                context: context,
                bgcolor: AppColors.grayColor,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
