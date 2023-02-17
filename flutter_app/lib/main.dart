import 'package:flutter/material.dart';

import 'package:flutter_app/login_registration_new/Screens/Start.dart';
import 'package:flutter_app/login_registration_new/Screens/forgot_password.dart';

import 'login_registration_new/Screens/successful_update_password.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect Flutter with Laravel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:StartScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

