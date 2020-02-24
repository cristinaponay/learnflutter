import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamcharts/models/user.dart';
import 'package:dreamcharts/models/dream.dart';

class DatabaseService {
  final String uid;
  final String email;
  DatabaseService({this.uid, this.email});

  // collection reference
  final CollectionReference dreamCollection =
      Firestore.instance.collection('dreams');

  Future<void> updateUserData(
      String date, String report, List<String> categories) async {
    return await dreamCollection.document(uid).setData({
      'date': date,
      'report': report,
      'categories': categories,
    });
  }

  // dream list from snapshot
  List<Dream> _dreamListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Dream(
          date: doc.data['date'] ?? '',
          report: doc.data['report'] ?? '',
          categories: List.from(doc.data['categories']) ?? ['']);
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        email: email,
        date: snapshot.data['date'],
        report: snapshot.data['report'],
        categories: List.from(snapshot.data['categories']));
  }

  // get dreams stream
  Stream<List<Dream>> get dreams {
    return dreamCollection.snapshots().map(_dreamListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return dreamCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
