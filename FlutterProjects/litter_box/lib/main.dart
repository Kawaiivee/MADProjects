import 'package:flutter/material.dart';
import 'package:random_names/random_names.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';
import 'package:litter_box/AnimalCard.dart';
import 'package:litter_box/model/UserForm.dart';

class LitterBoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Litter Box',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        fontFamily: 'Open Sans',
      ),
      home: SplashScreen(),
    );
  }
}

class MatchScreen extends StatefulWidget {
  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Litter Box"),
      ),
      body: Column(
        children: <Widget>[
          PetCard(),
        ],
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Litter Box"),
        leading: Builder(
          builder: (BuildContext context) {
            return Image.asset("assets/litter_box_icon.png");
          },
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Flexible(
                  child: Image.asset("assets/litter_box_icon.png"),
                ),
              ),
              Flexible(
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Username",
                  ),
                ),
              ),
              Flexible(
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  ),
                ),
              ),
              RaisedButton(
                child: Text("Login/Signup"),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

void main() => runApp(LitterBoxApp());