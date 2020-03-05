import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'controller/FormController.dart';
import 'model/FeedbackForm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Millennium All Stars Apparel Form',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FormPage(title: 'Millennium All Stars Apparel Form'),
    );
  }
}

class FormPage extends StatefulWidget {
  FormPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  @override
  Widget build(BuildContext context) {

    //Keys for form
    final _formKey = GlobalKey<FormState>();
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    //TextField Controllers
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController sizeController = TextEditingController();

    //Notifying messages
    _showSnackbar(String message){
      final snackBar = SnackBar(content: Text(message));
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    //Form submission method to save data to google sheets
    void _submitForm(){
      if(_formKey.currentState.validate()){

        //Construct Form
        FeedbackForm feedbackForm = FeedbackForm(
          firstNameController.text,
          lastNameController.text,
          emailController.text,
          sizeController.text
        );

        print(feedbackForm.toParams());

        //Send Response using FormController
        FormController formController = FormController( (String response) {
          print(response);
          if(response == FormController.STATUS_SUCCESS){
            //got saved to google sheets
            _showSnackbar("Apparel Request Confirmed!");
          }
          else{
            //Something went wrong in processing parameters
            _showSnackbar("Error Occurred");
          }
        });

        _showSnackbar("Submitting Apparel Request...");

        //Submit form and save to google sheets
        formController.submitForm(feedbackForm);
      }
    }

    //UI as code to get data from text fields
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Image.network(//replace with asset logo from layla
                        'https://scontent-ort2-1.xx.fbcdn.net/v/t1.0-9/17156034_10212484943857613_1401434816346233086_n.jpg?_nc_cat=107&_nc_sid=ca434c&_nc_ohc=6FjaoEI1q7oAX8FV48K&_nc_ht=scontent-ort2-1.xx&oh=dec8846ff88962d203b3cddc9b16018c&oe=5E9570AA'
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: firstNameController,
                    validator: (value) {
                      if(value.isEmpty){
                        return 'Enter a valid name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'First Name'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: lastNameController,
                    validator: (value) {
                      if(value.isEmpty){
                        return 'Enter a valid name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Last Name'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if(!value.contains('@')){
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Email Address'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: sizeController,
                    validator: (value) {
                      if(value.isEmpty){
                        return 'Enter a valid size';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Size (S, M, L, XL, ???)'),
                  ),
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: _submitForm,
                  child: Text("Request Apparel"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
