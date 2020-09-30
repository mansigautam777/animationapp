import 'package:flutter/material.dart';
import 'package:myanimation/animation.dart';

void main() {
  runApp(
    MaterialApp(
          debugShowCheckedModeBanner : false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 69, 0, 100),
          title: Text('FAMOUS QUOTES'),
        ),
        body: MyApp(),
      ),
    ),
  );
}
