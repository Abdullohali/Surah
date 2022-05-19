import 'package:flutter/material.dart';
import 'package:surah/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        highlightColor: Colors.green[900],
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}
