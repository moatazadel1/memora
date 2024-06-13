import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:memora/core/Firebase/firebase_functions.dart';

import '../../data/model/activityModel.dart';

class ActivityBar extends StatelessWidget {
  ActivityBar({super.key, required this.activityDetailsModel});
  ActivityDetailsModel activityDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
      child: Slidable(
        startActionPane: ActionPane(motion: DrawerMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              FirebaseFunctions()..deletActivities(activityDetailsModel.id!);
            },
            label: "Delete",
            backgroundColor: Colors.red,
            icon: Icons.delete,
            spacing: 12,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
          ),
        ]),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 12,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activityDetailsModel.activityName ?? "",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    activityDetailsModel.activityDesc ?? "",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  )
                ],
              ),
              Spacer(),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  child: const Icon(
                    Icons.done,
                    color: Color(0xFF0B8FAC),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
