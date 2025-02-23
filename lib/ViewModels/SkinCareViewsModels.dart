import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Models/SkincareModels.dart';
import '../Services/DatabaseConnection.dart';
import '../Widgets/showImagePickerDialog.dart';

class SkincareController extends GetxController {
  final SkincareService _service = SkincareService();


  var faceWash = false.obs;
  var toner = false.obs;
  var moisturizer = false.obs;
  var sunscreen = false.obs;
  var lipBalm = false.obs;
  var streakCount = 0.obs;
  var imageFile = Rx<File?>(null);
  var currentTime = "".obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startClock();
  }

  void startClock() {
    _timer = Timer.periodic(const Duration(seconds: 60), (timer) {
      currentTime.value = DateFormat('hh:mm a').format(DateTime.now());
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  Future<void> logRoutine(String userId) async {
    try {
      DateTime today = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(today);

      SkincareRoutine routine = SkincareRoutine(
        date: formattedDate,
        faceWash: faceWash.value,
        toner: toner.value,
        moisturizer: moisturizer.value,
        sunscreen: sunscreen.value,
        lipBalm: lipBalm.value,
      );

      await _service.addData(userId, routine, imageFile.value);
      await updateStreak(userId);

      Get.snackbar("Success", "Routine logged successfully!");
      imageFile.value = null;
      update(); // Refresh UI
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }


  void getDialog() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text('Select Image'),
        content: SingleChildScrollView(
          child: ImagePickerDialog(
            onImagePicked: (File pickedImage) {
              imageFile.value = pickedImage;
              update();
              Get.back();
            },
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }


  Future<void> updateStreak(String userId) async {
    try {
      int currentStreak = await _service.getUserStreak(userId);
      streakCount.value = currentStreak + 1;
      await _service.updateStreak(userId, streakCount.value);

      update();
    } catch (e) {
      print("Error updating streak: $e");
      Get.snackbar("Error", e.toString());
    }
  }


  Future<void> getUserStreak(String userId) async {
    try {
      streakCount.value = await _service.getUserStreak(userId);
      update(); // Refresh UI
    } catch (e) {
      print("Error fetching streak: $e");
      Get.snackbar("Error", e.toString());
    }
  }
}
