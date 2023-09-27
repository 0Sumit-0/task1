import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interviewtask/pages/signup.dart';
import 'package:interviewtask/pages/signup1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUpPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
