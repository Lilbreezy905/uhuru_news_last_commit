///uhuru official main page
///for more design or more information send email  bizimnabenibrice@gmail.com
///old api 7d811f56ffa36a0534a945379b0bfc06

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:uhuru_news/view/category_screen.dart';
import 'package:uhuru_news/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UHURU NEWS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
