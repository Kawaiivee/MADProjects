/// FeedbackForm is a data class which stores data fields of Feedback.
/// kind of like adapter for object class....or maybe just the object itself
/// to hold text field entries

import 'package:intl/intl.dart';

class FeedbackForm {

  //Form data from user
  String _firstname;
  String _lastname;
  String _email;
  String _size;

  //Timestamping? maybe
  static DateTime now = DateTime.now();
  String _timestamp = DateFormat('MM/dd/yyyy kk:mm:ss').format(now);
  FeedbackForm(this._firstname, this._lastname, this._email, this._size);

  // Method to make GET parameters.
  String toParams() =>
      "?firstname=" + _firstname +
      "&lastname=" + _lastname +
      "&email=" + _email +
      "&size=" + _size +
      "&timestamp=" + _timestamp;
}