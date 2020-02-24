import 'package:flutter/material.dart';
import 'package:litter_box/main.dart';
import 'package:random_names/random_names.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';

//Row widget for persistent bottom buttons menu

String glob_name = "";

class BottomButtons extends StatefulWidget {
  @override
  _BottomButtonsState createState() => _BottomButtonsState();
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  String _name = 'Ramir';
  int _idx = 2;
  void _nextEntry(){
    setState(() {
      var temp_list = generateRandomNames(1);
      _name = temp_list[0];
      glob_name = _name;
      var rng = new Random();
      _idx = rng.nextInt(20) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Litter Box'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Card(
              child: Image.network('https://randomfox.ca/images/' + '$_idx' + '.jpg'),
              margin: EdgeInsets.all(10),
            ),
            Positioned(
              top: 16,
              right: 64,
              child: Text(
                '$_name',
                style: TextStyle(fontSize: 32, color: Colors.white,),
              ),
            ),
            BottomButtons(),
          ],
        ),
      ),
    );
  }
}

class _BottomButtonsState extends State<BottomButtons> {

  void _like_toast(String name){
    Fluttertoast.showToast(msg: 'You liked ' + name, toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.greenAccent);
  }

  void _dislike_toast(String name){
    Fluttertoast.showToast(msg: 'You disliked ' + name, toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.greenAccent);
  }

  @override
  Widget build(BuildContext context) {

    //assign before returned widget is built what buttons to have
    final _buttons = <Widget>[
      Center(
        child: IconButton(
          icon: Icon(
            Icons.thumb_down,
            color: Colors.white,
          ),
          onPressed: () {_dislike_toast(glob_name);},
        ),
      ),
      Center(
        child: IconButton(
          icon: Icon(
            Icons.thumb_up,
            color: Colors.white,
          ),
          onPressed: () {_like_toast(glob_name);},
        ),
      ),

    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _buttons,
    );
  }
}
