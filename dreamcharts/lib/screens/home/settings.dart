import 'package:dreamcharts/models/user.dart';
import 'package:dreamcharts/services/database.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:dreamcharts/shared/loading.dart';
import 'package:dreamcharts/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  
  // form values
  String _currentDate;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          _currentDate = userData.date;
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Add a new dream',
                    style: TextStyle(color: Color(0xFF6C45BF), fontSize: 20)),
                SizedBox(height: 20.0),
                Text('Dream Title'),
                TextFormField(
                  initialValue: 'My dream',
                  decoration: textInputDecoration,
                ),
                SizedBox(height: 20.0),
                Text('Dream Date'),
                FlatButton(
                    onPressed: () async {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        minTime: DateTime(1960),
                        maxTime: DateTime.now(),
                        onConfirm: (date) {
                          print('confirm $date');
                          
                          setState(() {
                            _currentDate = '${date.year}-${date.month}-${date.day}';
                          });
                        },
                        currentTime: DateTime.parse(userData.date),
                        locale: LocaleType.en
                      );
                    },
                    child: Text(_currentDate),
                  ),
                
              ],
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
