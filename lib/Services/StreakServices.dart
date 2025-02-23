import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/StreakModels.dart';


class StreakService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch Streak Data
  Stream<DocumentSnapshot> getStreakStream(String userId) {
    return _firestore.collection('streaks').doc(userId).snapshots();
  }

  // Update Streak Count
  Future<void> updateStreak(String userId, DateTime lastLogged, int currentStreak) async {
    try {
      await _firestore.collection("streaks").doc(userId).set({
        "streakCount": currentStreak,
        "lastLoggedDate": Timestamp.fromDate(lastLogged),
      });
    } catch (e) {
      print("Error updating streak: $e");
    }
  }


}
