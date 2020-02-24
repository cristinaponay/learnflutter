import 'package:flutter/material.dart';
import 'package:dreamcharts/models/dream.dart';

class DreamTile extends StatelessWidget {
  final Dream dream;
  DreamTile({this.dream});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(dream.date),
          subtitle: Text(dream.report),
          leading: Icon(Icons.star),),
      ),
    );
  }
}
