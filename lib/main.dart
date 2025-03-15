import 'package:final_exam_640710963/answer1.dart';
import 'package:final_exam_640710963/answer2.dart';
import 'package:flutter/material.dart';

import 'screens/introduce.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyProfile(),
    );
  }
}
