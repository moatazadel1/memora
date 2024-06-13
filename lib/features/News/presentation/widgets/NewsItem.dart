import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilies/app_colors.dart';
import '../../data/models/NewsModel.dart';

class NewsItem extends StatelessWidget {
   NewsItem({super.key,required this.article,required this.onClick});
  Articles article;
  Function onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        margin: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
            color: AppColors.grayColor,
            borderRadius: BorderRadius.circular(20.r)
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: CachedNetworkImage(
                imageUrl:article.urlToImage??"",
                height: 250,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.source?.name??"",style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400
                  )),Text(article.title??"",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600
                      )),Text(article.description??"",style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
