import 'package:bigolive_app/UserPages/AuthPages/LoginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppStarter());
}

class AppStarter extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(false),
      
    );
  }
}
