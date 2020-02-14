import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    // set background image
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDaytime'] ? Color.fromRGBO(226, 158, 77, 1) : Color.fromRGBO(31, 49, 59, 1);
    Color txtColor = data['isDaytime'] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime': result['isDaytime'],
                            'flag': result['flag']
                          };
                        });
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: txtColor,
                      ),
                      label: Text(
                          'Edit Location',
                        style: TextStyle(
                          color: txtColor,
                        ),
                      )),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: txtColor,
                          backgroundColor: Color.fromRGBO(255, 255, 255, 0.25),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: txtColor,
                      backgroundColor: Color.fromRGBO(255, 255, 255, 0.25),
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
