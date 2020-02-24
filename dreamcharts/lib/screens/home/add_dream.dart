import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dreamcharts/services/database.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:dreamcharts/shared/constants.dart';
import 'package:dreamcharts/shared/loading.dart';
import 'package:dreamcharts/models/user.dart';
import 'package:intl/intl.dart';

class AddDream extends StatefulWidget {
  @override
  _AddDreamState createState() => _AddDreamState();
}

class _AddDreamState extends State<AddDream> {
  final _formKey = GlobalKey<FormState>();

  // form values
  DateTime _date = DateTime.now();
  String _dream = "", _title = "";
  List<dynamic> _categories = [];

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1960),
        lastDate: DateTime.now());

    if (picked != null && picked != _date) {
      print('Date selected: ${_date.toString()}');
      setState(() {
        _date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Container(
        child: StreamBuilder<UserData>(
            stream: DatabaseService(uid: user.uid, email: user.email).userData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserData userData = snapshot.data;

                return Form(
                  key: _formKey,
                  child: Scaffold(
                    backgroundColor: Color(0xFFF2F2F2),
                    appBar: AppBar(
                      title: Text(
                        user.email.toUpperCase(),
                        style: TextStyle(fontFamily: 'Nanum Gothic'),
                      ),
                      backgroundColor: Color(0xFF473273),
                    ),
                    body: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Add a New Dream',
                              style: TextStyle(
                                  color: Color(0xFF6C45BF),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 10.0),
                          Text(
                            'Dream Title',
                            style: textTitleField,
                          ),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'My dream'),
                            style: TextStyle(fontSize: 20),
                            onChanged: (val) => setState(() => _title = val),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Dream Date',
                            style: textTitleField,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                DateFormat('yyyy-MM-dd').format(_date),
                                style: TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () {
                                  _selectDate(context);
                                },
                              )
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Dream Category',
                            style: textTitleField,
                          ),
                          SizedBox(height: 10.0),
                          MultiSelectFormField(
                            titleText: 'Categories',
                            dataSource: multiCategories,
                            textField: 'display',
                            valueField: 'value',
                            okButtonLabel: 'OK',
                            cancelButtonLabel: 'Cancel',
                            value: _categories,
                            onSaved: (val) {
                              if (val == null) return;
                              setState(() {
                                _categories = val;
                              });
                            },
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Dream Details',
                            style: textTitleField,
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            maxLines: 4,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF6C45BF)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF6C45BF)),
                              ),
                            ),
                            style: TextStyle(fontSize: 20),
                            onChanged: (val) => setState(() => _dream = val),
                          ),
                          Center(
                            child: SizedBox(
                              width: 300,
                              child: RaisedButton(
                                onPressed: () async {
                                  print('Category ${_categories}');
                                  await DatabaseService(uid: user.uid, email: user.email)
                                      .updateUserData(
                                    DateFormat('yyyy-MM-dd').format(_date) ??
                                        snapshot.data.date,
                                    _dream ?? snapshot.data.report,
                                    _categories.cast<String>().toList() ??
                                        snapshot.data.categories,
                                  );
                                  Navigator.pop(context);
                                },
                                color: Color(0xFFA38BD9),
                                child: Text(
                                  'ADD DREAM',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                    side: BorderSide(color: Color(0xFF6C45BF))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Loading();
              }
            }));
  }
}
