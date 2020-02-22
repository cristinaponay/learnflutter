import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamcharts/models/user.dart';
import 'package:dreamcharts/models/dream.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference dreamCollection = Firestore.instance.collection('dreams');

  Future<void> updateUserData(String date, String dreamReport, List<String> categories) async {
    return await dreamCollection.document(uid).setData({
      'date': date,
      'dreamReport': dreamReport,
      'categories': categories,
    });
  }

   // brew list from snapshot
  List<Dream> _dreamListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Dream(
        date: doc.data['date'] ?? '',
        dreamReport: doc.data['dreamReport'] ?? 0,
        categories: doc.data['categories'] ?? '0'
      );
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      date: snapshot.data['date'],
      dreamReport: snapshot.data['dreamReport'],
      categories: snapshot.data['categories']
    );
  }

  // get brews stream
  Stream<List<Dream>> get brews {
    return dreamCollection.snapshots()
      .map(_dreamListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return dreamCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }


}