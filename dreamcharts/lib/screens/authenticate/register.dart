import 'package:dreamcharts/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:dreamcharts/services/auth.dart';
import 'package:dreamcharts/shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Color(0xFFA38BD9),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            SizedBox(height: 100.0),
            Text(
              'USERNAME',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xFF473273),
                fontFamily: 'Nanum Gothic',
                fontSize: 18),
            ),
            TextFormField(
              style: TextStyle(
                color: Colors.white,
                fontSize: 18),
              decoration: textInputDecoration.copyWith(hintText: 'Email'),
              validator: (val) => val.isEmpty ? 'Enter an email' : null,
              onChanged: (val) {
                setState(() => email = val);
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'PASSWORD',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xFF473273),
                fontFamily: 'Nanum Gothic',
                fontSize: 18),
            ),
            TextFormField(
              style: TextStyle(
                color: Colors.white,
                fontSize: 18),
              decoration: textInputDecoration.copyWith(hintText: 'Password'),
              validator: (val) =>
                  val.length < 8 ? 'Enter a password 8+ characters long' : null,
              onChanged: (val) {
                setState(() => password = val);
              },
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            SizedBox(
                width: 300,
                child: RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result =
                          await _auth.registerWithEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Please supply a valid email';
                          loading = false;
                        });
                      }
                      else {
                        Navigator.popUntil(
                                    context, ModalRoute.withName('/'));
                      }
                    }
                  },
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(color: Color(0xFF6141A6), fontSize: 20),
                  ),
                ),
              ),
            SizedBox(height: 12.0),
            Text(
              error,
              style: TextStyle(color: Color(0xFF6C45BF), fontSize: 14.0),
            )
          ]),
        ),
      ),
    );
  }
}