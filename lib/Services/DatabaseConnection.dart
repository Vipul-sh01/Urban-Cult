import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../Models/SkincareModels.dart';

class SkincareService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> addData(String userId, SkincareRoutine routine, File? image) async {
    try {
      String imageUrl = "";

      if (image != null) {
        Reference ref = _storage.ref().child("images/${DateTime.now().millisecondsSinceEpoch}.jpg");
        UploadTask uploadTask = ref.putFile(image);
        TaskSnapshot snapshot = await uploadTask;
        imageUrl = await snapshot.ref.getDownloadURL();
      }

      QuerySnapshot existingLogs = await firestore
          .collection("users")
          .doc(userId)
          .collection("skincareLogs")
          .where("date", isEqualTo: routine.date)
          .get();

      if (existingLogs.docs.isNotEmpty) {
        throw Exception("Routine already logged today!");
      }

      await firestore.collection("users").doc(userId).collection("skincareLogs").add(
        routine.toMap()..["imageUrl"] = imageUrl,
      );
    } catch (e) {
      print("Error adding skincare data: $e");
      rethrow;
    }
  }

  Future<int> getUserStreak(String userId) async {
    try {
      DocumentSnapshot streakDoc = await firestore
          .collection("users")
          .doc(userId)
          .collection("streak")
          .doc("data")
          .get();

      if (streakDoc.exists && streakDoc.data() != null) {
        return streakDoc["streakCount"] ?? 0;
      } else {
        return 0;
      }
    } catch (e) {
      print("Error fetching user streak: $e");
      return 0;
    }
  }

  Future<void> updateStreak(String userId, int newStreak) async {
    try {
      DateTime today = DateTime.now();
      await firestore.collection("users").doc(userId).collection("streak").doc("data").set({
        "streakCount": newStreak,
        "lastLoggedDate": today.toIso8601String().split('T')[0],
      });
    } catch (e) {
      print("Error updating streak: $e");
      rethrow;
    }
  }
}
