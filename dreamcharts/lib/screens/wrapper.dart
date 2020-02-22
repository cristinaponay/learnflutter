import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dreamcharts/screens/authenticate/authenticate.dart';
import 'package:dreamcharts/screens/home/home.dart';
import 'package:dreamcharts/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either home or authenticate
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}