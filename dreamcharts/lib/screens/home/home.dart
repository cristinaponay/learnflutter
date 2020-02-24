import 'package:dreamcharts/screens/home/dreamlist.dart';
import 'package:flutter/material.dart';
import 'package:dreamcharts/services/auth.dart';
import 'package:dreamcharts/services/database.dart';
import 'package:provider/provider.dart';
import 'package:dreamcharts/models/dream.dart';
import 'package:dreamcharts/screens/home/settings.dart';
import 'package:dreamcharts/models/user.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return Container(
      child: StreamProvider<List<Dream>>.value(
        value: DatabaseService().dreams,
        child: Scaffold(
          backgroundColor: Color(0xFFF2F2F2),
          appBar: AppBar(
            title: Text(user.email.toUpperCase(), style: TextStyle(fontFamily: 'Nanum Gothic'),),
            backgroundColor: Color(0xFF473273),
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                onPressed: () async {
                  dynamic result = await _auth.signOut();
                  if (result != null) {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  }
                },
                icon: Icon(Icons.person),
              ),
              IconButton(
                onPressed: () => _showSettingsPanel(),
                icon: Icon(Icons.settings),
              ),
            ],
          ),
          // body: Container(child: DreamList()),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 350,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/add');
                    },
                    color: Color(0xFFA38BD9),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: Color(0xFF6C45BF))
                    ),
                    child: Text(
                      'ADD A NEW DREAM',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Text(
                  'YOUR DREAMS',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF473273),
                    fontSize: 18),
                ),
                SizedBox(height: 10.0,),
                Container(
                  height: 100,
                  width: 350,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                    border: Border.all(color: Color(0xFF473273))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text(
                        "Dream Records",
                        style: TextStyle(
                          fontSize: 20),)
                    ],),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
