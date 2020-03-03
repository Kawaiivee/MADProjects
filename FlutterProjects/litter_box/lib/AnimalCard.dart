import 'package:flutter/material.dart';
import 'package:random_names/random_names.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';
import 'package:litter_box/model/UserForm.dart';

class PetCard extends StatefulWidget {
  @override
  _PetCardState createState() => _PetCardState();
}

class _PetCardState extends State<PetCard> {

  String _name = 'Ramir';
  int _idx = 4;
  void _nextEntry(){
    setState(() {
      var temp_list = generateRandomNames(1);
      _name = temp_list[0];
      var rng = new Random();
      _idx = rng.nextInt(20) + 1;
    });
  }

  void _liketoast(){
    Fluttertoast.showToast(msg: "YOU LIKED " + _name);
  }

  void _disliketoast(){
    Fluttertoast.showToast(msg: "YOU DISLIKED " + _name);
  }

  @override
  Widget build(BuildContext context) {
    //Image of Animal to return
    final _img = Image.network('https://randomfox.ca/images/' + '$_idx' + '.jpg');

    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.all(32),
      color: Colors.green,
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Align(
          alignment: Alignment.center,
          child: Card(
            margin: EdgeInsets.all(4),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Card(
                    margin: EdgeInsets.all(8),
                    child: _img,
                  ),
                ),
                Positioned(
                  bottom: 4.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          //More data stuff here
                          _disliketoast();
                          _nextEntry();
                        },
                        icon: Icon(
                          Icons.thumb_down,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          //more data stuff here
                          _liketoast();
                          _nextEntry();
                        },
                        icon: Icon(
                          Icons.thumb_up,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 8.0,
                  child: Text("Ramir, Species, Age"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
