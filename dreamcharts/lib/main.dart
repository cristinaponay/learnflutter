import 'package:dreamcharts/screens/authenticate/splash.dart';
import 'package:dreamcharts/screens/authenticate/register.dart';
import 'package:dreamcharts/screens/authenticate/sign_in.dart';
import 'package:dreamcharts/screens/home/add_dream.dart';
import 'package:dreamcharts/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:dreamcharts/services/auth.dart';
import 'package:dreamcharts/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:dreamcharts/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(),
          '/authenticate': (context) => Splash(),
          '/register': (context) => Register(),
          '/signin': (context) => SignIn(),
          '/home': (context) => Home(),
          '/add': (context) => AddDream(),
        },
        theme: ThemeData(
          // Temp theme colors
          primaryColor: Color(0xFF6C45BF),
          accentColor: Color(0xFF473273),

          // Define default font family
          fontFamily: 'Raleway'

        ),
      ),
    );
  }
}

