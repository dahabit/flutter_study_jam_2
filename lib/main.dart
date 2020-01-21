import 'package:flutter/material.dart';
import 'package:studyjam5/screens/second_screen.dart';
import 'package:studyjam5/screens/third_screen.dart';
import 'package:studyjam5/utils/theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: myThemeData,
      //home: HomeScreen(),
      initialRoute: '/second',
      routes: {
        '/': (context) => HomeScreen(),
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
      },
    );
  }
}
