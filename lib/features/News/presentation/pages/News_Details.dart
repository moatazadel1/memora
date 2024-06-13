import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memora/core/components/reusable_components.dart';
import 'package:memora/core/utilies/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/NewsModel.dart';

class NewsDetails extends StatefulWidget {
  NewsDetails({super.key, required this.article});

  Articles article;

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.r),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: CachedNetworkImage(
                imageUrl: widget.article.urlToImage ?? "",
                height: 250,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.article.source?.name ?? "",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400)),
                  Text(widget.article.title ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    widget.article.content ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.grey, wordSpacing: 5.sp),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                useButton(
                  onClick: () async {
                    print(widget.article.url!);
                    Uri url = Uri.parse(widget.article.url!);
                    if (!await launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    )) {
                      throw Exception('Could not launch $url');
                    }
                    setState(() {});
                  },
                  txt: "View Full article",
                  context: context,
                  bgcolor: AppColors.primaryColor,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
