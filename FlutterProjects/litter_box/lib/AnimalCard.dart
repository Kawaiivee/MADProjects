import 'package:flutter/material.dart';
import 'package:litter_box/main.dart';
import 'package:random_names/random_names.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';

class AnimalCard extends StatefulWidget {
  @override
  _AnimalCardState createState() => _AnimalCardState();
}

class _AnimalCardState extends State<AnimalCard> {

  String _name = 'Ramir';
  int _idx = 2;
  void _nextEntry(){
    setState(() {
      var temp_list = generateRandomNames(1);
      _name = temp_list[0];
      var rng = new Random();
      _idx = rng.nextInt(20) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Image of Animal to return
    final _img = Image.network('https://randomfox.ca/images/' + '$_idx' + '.jpg');
    return SizedBox(
      width: 192,
      height: 192,
      child: Card(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 4.0,
              child: _img,
            ),
            Positioned(
              bottom: 4.0,
              child: Text('Buttons Here for now'),
            ),
            Positioned(
              top: 8.0,
              child: Text("Ramir, Species, Age"),
            ),
          ],
        ),
      ),
    );
  }
}
