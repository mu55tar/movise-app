import 'package:flutter/material.dart';
import 'package:move_app/ui/Accounts%20Screens/loginscreen.dart';

//import 'package:move_app/ui/regesterScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
