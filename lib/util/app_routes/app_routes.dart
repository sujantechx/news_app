import 'package:flutter/cupertino.dart';
import 'package:news_app/Ui%20Screen/explore.dart';
import 'package:news_app/Ui%20Screen/home.dart';
import 'package:news_app/Ui%20Screen/intro.dart';
import 'package:news_app/Ui%20Screen/profile.dart';
import 'package:news_app/Ui%20Screen/save.dart';
import 'package:news_app/Ui%20Screen/splash.dart';
import 'package:news_app/dashbord/dash_bord.dart';

class AppRoutes {

  static const String splash="/";
  static const String intro="/intro";
  static const String home="/home";
  static const String explore="/explore";
  static const String saved="/saved";
  static const String profile="/profile";
  static const String dashbord="/dashbord";

static Map<String,Widget Function(BuildContext)>routs={
  splash:(_)=>Splash(),
  intro:(_)=>Intro(),
  home:(_)=>Home(),
  explore:(_)=>Explore(),
  saved:(_)=>Saved(),
  profile:(_)=>Profile(),
  dashbord:(_)=>DashBord()

};
}