import 'dart:async';

import 'package:flutter/material.dart';
import 'package:posttest5/Posttest2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SS();
  }

  SS() {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => FavouriteBandPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 2;
    var height = MediaQuery.of(context).size.height / 2;
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/spotify.png",
          width: width,
          height: height,
        ),
      ),
    );
  }
}
