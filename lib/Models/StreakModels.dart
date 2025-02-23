import 'package:cloud_firestore/cloud_firestore.dart';

class Streak {
  final int streakCount;
  final Timestamp lastLoggedDate;

  Streak({
    required this.streakCount,
    required this.lastLoggedDate,
  });

  factory Streak.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Streak(
      streakCount: data['streakCount'] ?? 0,
      lastLoggedDate: data['lastLoggedDate'] as Timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "streakCount": streakCount,
      "lastLoggedDate": lastLoggedDate,
    };
  }
}
