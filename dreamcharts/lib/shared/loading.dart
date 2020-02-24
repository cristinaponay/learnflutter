import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF6C45BF),
      child: Center(
        child: SpinKitCircle(
          color: Color(0xFFF2F2F2),
          size: 100.0,
        ),
      ),
    );
  }
}