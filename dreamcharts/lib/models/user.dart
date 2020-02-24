class User {
  final String uid;
  final String email;

  User({this.uid, this.email});
}

class UserData {
  final String uid;
  final String email;
  final String date;
  final String title;
  final String report;
  final List<String> categories;

  UserData(
      {this.uid, this.email, this.date, this.title, this.report, this.categories});
}
