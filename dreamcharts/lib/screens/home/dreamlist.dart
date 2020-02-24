import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dreamcharts/models/dream.dart';
import 'package:dreamcharts/screens/home/dreamtile.dart';

class DreamList extends StatefulWidget {
  @override
  _DreamListState createState() => _DreamListState();
}

class _DreamListState extends State<DreamList> {
  @override
  Widget build(BuildContext context) {

    final dreams = Provider.of<List<Dream>>(context) ?? [];

    return ListView.builder(
      itemCount: dreams.length,
      itemBuilder: (context, index) {
        return DreamTile(dream: dreams[index]);
      },
    );
  }
}