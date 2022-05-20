import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:surah/screens/home_page.dart';

class TitleSceen extends StatefulWidget {
  const TitleSceen({Key? key, required this.assetPath}) : super(key: key);
  final String assetPath;
  @override
  State<TitleSceen> createState() => _TitleSceenState();
}

class _TitleSceenState extends State<TitleSceen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomePage()));
    });
    // Navigator.push(context, MaterialPageRoute(builder: (_) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Lottie.asset(widget.assetPath),
        ));
  }
}
