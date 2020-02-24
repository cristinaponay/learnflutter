import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6C45BF),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 50.0),
              GradientText(
                "Dreamcharts", 
                gradient: LinearGradient(
                  colors: [Colors.white, Color(0xF2F2F2)]),
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nanum Gothic'),),
              SizedBox(height: 50.0),
              SizedBox(
                width: 300,
                child: RaisedButton(
                  onPressed: () async {
                    await Navigator.pushNamed(context, '/register');
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
              SizedBox(height: 20.0),
              SizedBox(
                width: 300,
                child: RaisedButton(
                  onPressed: () async {
                    await Navigator.pushNamed(context, '/signin');
                  },
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Color(0xFF6141A6), fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
