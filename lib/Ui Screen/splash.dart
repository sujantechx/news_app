import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/Ui%20Screen/intro.dart';
import 'package:news_app/util/app_routes/app_routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(
      seconds: 2
    ),
        () {
          Navigator.pushReplacementNamed(context, AppRoutes.intro);
        },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("News ToDay",
          style: TextStyle(
          color: Colors.blue,fontWeight: FontWeight.bold,
            fontStyle:FontStyle.italic,
            fontSize: 28,
        ),),
      ),

    );
  }
}
