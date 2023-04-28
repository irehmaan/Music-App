// ignore_for_file: implementation_imports

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:musicappnew/modules/splashscreen/Widgets/splash_one.dart';
import 'package:musicappnew/modules/singers/Pages/SingerView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _loadAndMove() {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => const SingerView()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadAndMove();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashOne();
  }
}
