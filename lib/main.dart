import 'package:flutter/material.dart';
import 'splashscreencalc.dart';

void main(){
  runApp(MyCalc());
}

class MyCalc extends StatelessWidget {
  const MyCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySplash(),
    );
  }
}
