import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/material_white.dart';
import 'package:instagram_clone/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: white),
    );
  }
}
