import 'package:flutter/material.dart';
import 'package:memora/core/Firebase/firebase_functions.dart';

import '../widget/activities_bar.dart';
import '../widget/button_1.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key});

  FirebaseFunctions firebaseFunctions = FirebaseFunctions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: CurvedButtonBar(
                  onPressed: (buttonIndex) {},
                ),
              ),
            ),
          ],
        ),
        Expanded(
            child: StreamBuilder(
                stream: firebaseFunctions.getActivities(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Something Wrong."));
                  }
                  var data =
                      snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                  if (data.isEmpty) {
                    return Center(child: Text("No Activities"));
                  }
                  return ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 1,
                    ),
                    itemBuilder: (context, index) {
                      return ActivityBar(
                        activityDetailsModel: data[index],
                      );
                    },
                    itemCount: data.length,
                  );
                }))
      ],
    ));
  }
}
