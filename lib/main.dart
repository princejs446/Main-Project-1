import 'package:flutter/material.dart';
import 'package:main_project1/ListScreen.dart';

import 'package:main_project1/TaskScreen.dart';
import 'package:main_project1/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   debugShowCheckedModeBanner: false,
   home: Taskscreen(),
    );
  }
}

