import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memora/features/Authentication/presentation/pages/auth.dart';
import 'package:memora/features/signUp/presentation/pages/Details.dart';
import 'package:memora/features/Home/presentation/pages/home.dart';
import 'package:memora/features/Login/presentation/pages/login.dart';
import 'package:memora/features/News/presentation/pages/news.dart';
import 'package:memora/features/activitiestab/presentation/pages/activities_tab.dart';
import 'package:memora/features/activitiestab/presentation/widget/edit_activities.dart';
import 'package:memora/features/detection/presentation/test.dart';
import 'package:memora/features/mainScreen/presentation/pages/mainScreen.dart';
import 'package:memora/features/signUp/presentation/pages/signUp.dart';
import 'package:memora/features/trackingtab/presentation/pages/tracking_tab.dart';
import 'package:memora/features/trackingtab/presentation/pages/mapScreen.dart';
import '../../features/Contacts/presentation/pages/Contacts.dart';

class AppRoutesName{
  static const String auth="/";
  static const String news="news";
  static const String signUp="signup";
  static const String details="details";
  static const String login="login";
  static const String home="home";
  static const String newsDetails="newsDetails";
  static const String trackingTab="trackingTab";
  static const String mainScreen="mainScreen";
  static const String mapScreen="mapScreen";
  static const String contacts="contacts";
  static const String detection="detect";
  static const String editAct= "edit_activities";
  static const String Act= "activity";

}
class AppRouting{
  static Route onGenerate(RouteSettings settings){
    switch (settings.name){
      case AppRoutesName.auth:
        return MaterialPageRoute(
          builder: (context) => Auth(),
        );
      case AppRoutesName.news:
        return MaterialPageRoute(builder: (context) => News(),);
      case AppRoutesName.signUp:
        return MaterialPageRoute(builder: (context) => SignUp(),);
      case AppRoutesName.details:
        return MaterialPageRoute(builder: (context) => Details(),);
      case AppRoutesName.login:
        return MaterialPageRoute(builder: (context) => Login(),);
      case AppRoutesName.home:
        return MaterialPageRoute(builder: (context) => Home(),);
      case AppRoutesName.trackingTab:
        return MaterialPageRoute(builder: (context) => TrackingTab(),);
      case AppRoutesName.mainScreen:
        return MaterialPageRoute(builder: (context) => MainScreen(),);
      case AppRoutesName.mapScreen:
        return MaterialPageRoute(builder: (context) => MapScreen(),);
      case AppRoutesName.contacts:
        return MaterialPageRoute(builder: (context) => Contacts(),);
      case AppRoutesName.detection:
        return MaterialPageRoute(builder: (context) => MyHomePage(),);
      case AppRoutesName.editAct:
        return MaterialPageRoute(builder: (context) => EditActivities(),);
      case AppRoutesName.editAct:
        return MaterialPageRoute(builder: (context) => ActivityScreen(),);
      default:
        return MaterialPageRoute(builder: (context) =>unDefienedRoutes() ,);
    }
  }
}
Widget unDefienedRoutes(){
  return Scaffold(
    appBar: AppBar(),
    body: Center(child: Text("UnDefined Routes")),
  );
}