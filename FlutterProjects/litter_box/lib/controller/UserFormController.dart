import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../model/UserForm.dart';

class FormController{

  //calllback function for http request
  final void Function(String) callback;

  //String url for connecting to sheet
  static const String URL = "https://script.google.com/macros/s/AKfycbz9GRJ1lodqBx1Xlg-246OBz-ZqhtgfBiWj1cye9fHjyMb24-t-/exec";

  //Success message for status of callback
  static const STATUS_SUCCESS = "SUCCESS";

  //Constructor for form, which is mainly a string holder
  FormController(this.callback);

  //async fn which saves form parameters and send http get request on the url
  //call back is called when there is a successful response

  void submitForm(UserForm  userForm) async {
    try{
      await http.get(
        URL + userForm.toParams()
      )
      .then(
        (response) {
          callback(convert.jsonDecode(response.body)['status']);
        }
      );
    }
    catch(e){
      print(e);
    }
  }
}