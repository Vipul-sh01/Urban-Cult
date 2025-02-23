import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constents/AppConstents.dart';
import '../Services/ImagePicker.dart';
import '../ViewModels/SkinCareViewsModels.dart';

class RoutineItemTile extends StatelessWidget {
  final String time;
  final String text;
  final String disText;
  final bool isChecked;
  final VoidCallback onPressed;

  RoutineItemTile({
    super.key,
    required this.time,
    required this.text,
    required this.disText,
    required this.isChecked,
    required this.onPressed,
  });

  // Controllers should be initialized higher up in the widget tree
  final SkincareController skincareController = Get.put(SkincareController());
  final ImagePickerService imagePickerService = Get.put(ImagePickerService());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppConstants.marginVertical),
      padding: EdgeInsets.all(AppConstants.paddingAll),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppConstants.boxColor.withOpacity(0.1),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onPressed, // Calls parent function to toggle state
            child: Container(
              width: AppConstants.checkboxSize,
              height: AppConstants.checkboxSize,
              decoration: BoxDecoration(
                color: AppConstants.boxColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: isChecked
                  ? Icon(Icons.check, color: AppConstants.iconColor, size: AppConstants.iconSize)
                  : null,
            ),
          ),
          SizedBox(width: AppConstants.sizedBoxWidth),

          // Text Content with GestureDetector
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.snackbar("Info", "You tapped on the text");
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text, style: AppConstants.titleTextStyle),
                  Text(disText, style: AppConstants.subtitleTextStyle),
                ],
              ),
            ),
          ),

          // Camera Icon & Time
          Row(
            children: [
              InkWell(
                onTap: () {
                  skincareController.getDialog();
                },
                child: Image.asset(
                  'assets/Camera.jpeg',
                  width: 30,
                  height: 30,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Get.snackbar("Time", "Time tapped");
                },
                child: Text(time, style: AppConstants.timeTextStyle, ), // Fixed time usage
              ),
            ],
          ),
        ],
      ),
    );
  }
}
