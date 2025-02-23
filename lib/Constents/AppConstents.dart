import 'package:flutter/material.dart';

class AppConstants {
  // AppBar Title
  static const String appTitle = "Daily Skincare";
  static const String cleanser = "Cleanser";
  static const String cleanserDetails = "Cetaphil Gentle Skin Cleanser";
  static const String toner = "Toner";
  static const String tonerDetails = "Thayers Witch Hazel Toner";
  static const String moisturizer = "Moisturizer";
  static const String moisturizerDetails = "Kiehl's Ultra Facial Cream";
  static const String sunscreen = "Sunscreen";
  static const String sunscreenDetails = "Supergoop Unseen Sunscreen SPF 40";
  static const String lipBalm = "Lip Balm";
  static const String lipBalmDetails = "Glossier Birthday Balm Dotcom";
  static const String routine = "Routine";
  static const String streaks = "Streaks";

  //Streak Screen text
  static const String streakTitle = "Streak";
  static const String todayGoal = "Today's Goal: 3 streak days";
  static const String keepItUp = "Keep it up! You're on a roll.";
  static const List<String> graphLabels = ["1D", "1W", "1M", "3M", "1Y"];

  // Margins & Padding
  static const double marginVertical = 8.0;
  static const double paddingAll = 12.0;
  static const double checkboxSize = 52.0;
  static const double iconSize = 30.0;
  static const double sizedBoxWidth = 12.0;
  static const double sizedBoxWidthSmall = 6.0;

  // Colors
  static const Color whiteColor = Colors.white;
  static const Color boxColor = Color(0xFFF2E8EB);
  static const Color iconColor = Color(0xFF1C0D12);
  static const Color textColor = Colors.black87;
  static const Color secondaryTextColor = Color(0xFF964F66);
  static const Color greenColor = Color(0xFF088759);


  // Text Styles
  static const TextStyle appBarTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  static const TextStyle titleTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static const TextStyle subtitleTextStyle = TextStyle(fontSize: 14, color: secondaryTextColor);
  static const TextStyle timeTextStyle = TextStyle(fontSize: 11, color: secondaryTextColor);

  //Streak Styles
  static const TextStyle goalTextStyle = TextStyle(fontSize: 18, color: AppConstants.iconColor, fontWeight: FontWeight.w700);
  static const TextStyle dailyStreakTitle = TextStyle(fontSize: 18, fontWeight: FontWeight.w500,);
  static const TextStyle dailyStreakNumber = TextStyle(fontSize: 26, fontWeight: FontWeight.w500,);
  static TextStyle last30Days = TextStyle(fontSize: 14, color: AppConstants.secondaryTextColor,);
  static const TextStyle percentageIncrease = TextStyle(fontSize: 14, color: AppConstants.greenColor,);
  static const TextStyle keepTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
}
