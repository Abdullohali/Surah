import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surah/Cubit/cubit/text_cubit.dart';
import 'package:surah/screens/home_page.dart';
import 'package:surah/screens/title_screen.dart';

Future<void> main() async {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TextCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        highlightColor: Colors.green[900],
        primarySwatch: Colors.green,
        primaryColor: Colors.orange.shade100,
      ),
      home: const TitleSceen(assetPath: 'assets/json/lottie.json'),
    );
  }
}
