import 'package:flutter/material.dart';
import 'package:dreamcharts/services/auth.dart';
import 'package:dreamcharts/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:dreamcharts/models/user.dart';

// void main() => runApp(MaterialApp(
//   initialRoute: '/',
//   routes: {
//     '/': (context) => Loading(),
//     '/home': (context) => Home(),
//   },
// ));
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

