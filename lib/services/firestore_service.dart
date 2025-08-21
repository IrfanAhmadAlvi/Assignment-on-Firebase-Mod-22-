import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/match_model.dart';

class FirestoreService {
  static final _db = FirebaseFirestore.instance;

  static Stream<List<MatchModel>> streamMatches() {
    return _db.collection('matches')
        .orderBy('startTime', descending: false)
        .snapshots()
        .map((snap) => snap.docs
        .map((d) => MatchModel.fromMap(d.id, d.data()))
        .toList());
  }

  static Stream<MatchModel> streamMatchById(String id) {
    return _db.collection('matches').doc(id).snapshots().map((d) {
      final data = d.data() ?? {};
      return MatchModel.fromMap(d.id, data);
    });
  }
}
