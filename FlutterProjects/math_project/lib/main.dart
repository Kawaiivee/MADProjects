import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Practice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Math Practice'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _opA = 0;
  var _opB = 0;
  double _doubleA = 0.0;
  double _doubleB = 0.0;
  var _sln = 0;
  var _doubleSln = 0.0;
  int _opcode = 0;
  String _operation = '';
  String _eq = '';
  String _answer = '';
  int _score = 0;
  bool _mode = false;

  final int _difficulty = 13;

  void _makeProblem() {
    setState(() {
      _opA = (new Random()).nextInt(_difficulty);
      _opB = (new Random()).nextInt(_difficulty);
      _opcode = (new Random()).nextInt(3);

      if (_opcode == 0) {
        _operation = ' + ';
        _sln = _opA + _opB;
      }
      else if (_opcode == 1) {
        _operation = ' - ';
        _sln = _opA - _opB;
      }
      else if (_opcode == 2) {
        _operation = ' x ';
        _sln = _opA * _opB;
      }
      else if(_opcode == 3){
        _doubleA = (new Random()).nextInt(_difficulty*_difficulty) as double;
        _doubleB = (new Random()).nextInt(_difficulty) as double;

        while(
          _doubleB < _doubleA ||
          _opA % _opB != 0
        ){
          _doubleA = (new Random()).nextInt(_difficulty*_difficulty) as double;
          _doubleB = (new Random()).nextInt(_difficulty) as double;
          print("Stuff");
        }
        _operation = ' / ';
        _doubleSln = _doubleA / _doubleB;

        _opA = _doubleA as int;
        _opB = _doubleB as int;
        _sln = _doubleSln as int;
      }
      else {
        _operation = ' % ';
        _sln = _opA % _opB;
      }

      if (_mode) {
        _eq = _opA.toString() + _operation + _opB.toString() + ' = ' +
            _sln.toString();
      }
      else {
        _eq = _opA.toString() + _operation + _opB.toString() + ' = ?';
      }
    });
  }

  void _buildAnswer(String input){
    setState((){
      _answer += input;
    });
  }

  void _answerProblem(String input) {
    setState(() {
      if(_answer == _sln)
        _score++;
      else{
        _score--;
      }
    });
  }

  void _setStudyMode() {
    setState(() {
      _mode = true;
      _score = 0;
    });
  }

  void _setQuizMode() {
    setState(() {
      _mode = false;
      _score = 0;
    });
  }

  void _showAccuracy(String input){
    setState(() {
      String _message = "";
      if(int.parse(input) == _sln)
        _message = "Correct! Answer is: " + input;
      else{
        _message = 'Wrong! Answer is: ' + input;
      }
      Fluttertoast.showToast(
        msg: _message,
        gravity: ToastGravity.CENTER,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var _screenHeight = (MediaQuery.of(context).size.height);
    var _screenWidth = (MediaQuery.of(context).size.width);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text(
            '$_eq',
            style: TextStyle(fontSize: min(_screenHeight*.2, _screenWidth*.15),
            ),
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text(
                  '1'
                ),
              ),
              FlatButton(
                child: Text(
                    '2'
                ),
              ),
              FlatButton(
                child: Text(
                    '3'
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text(
                    '4'
                ),
              ),
              FlatButton(
                child: Text(
                    '5'
                ),
              ),
              FlatButton(
                child: Text(
                    '6'
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text(
                    '7'
                ),
              ),
              FlatButton(
                child: Text(
                    '8'
                ),
              ),
              FlatButton(
                child: Text(
                    '9'
                ),
              ),
            ],
          ),
      ),
    ),
      persistentFooterButtons: <Widget>[
        Text(
          'Score = $_score'
        ),
        FlatButton(
          child: Text(
            'Study Mode'
          ),
          onPressed: _setStudyMode,
        ),
        FlatButton(
          child: Text(
            'Quiz Mode'
          ),
          onPressed: _setQuizMode,
        ),
      ],
    );
  }
}
