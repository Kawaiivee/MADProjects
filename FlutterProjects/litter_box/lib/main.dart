import 'package:flutter/material.dart';
import 'package:random_names/random_names.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';
import 'package:litter_box/BottomButtons.dart';

class LitterBoxApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Litter Box',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        fontFamily: 'Open Sans',
      ),
      home: FirstPage(),
    );
  }
}



void main() => runApp(LitterBoxApp());