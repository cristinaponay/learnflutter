class User {
  final String uid;

  User({this.uid});
}

class UserData {

  final String uid;
  final String date;
  final String dreamReport;
  final List<String> categories;

  UserData({ this.uid, this.date, this.dreamReport, this.categories });

}