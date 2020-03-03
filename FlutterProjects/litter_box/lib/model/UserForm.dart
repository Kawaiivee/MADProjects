import 'package:flutter/material.dart';
import 'package:random_names/random_names.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';
import 'package:litter_box/AnimalCard.dart';

class UserForm{
  String _uid;
  String _name;
  String _password;
  String _pet;
  String _bio;

  UserForm(this._uid, this._name, this._password, this._pet, this._bio);

  String toParams() => "?uid=$_uid&name=$_name&password=$_password&pet=$_pet&bio=$_bio";
}