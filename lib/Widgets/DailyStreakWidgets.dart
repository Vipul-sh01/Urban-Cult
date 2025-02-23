import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constents/AppConstents.dart';
 // Import the new file

class DailyStreakWidgets extends StatelessWidget {
  final int dailyStreak;
  const DailyStreakWidgets({super.key, required this.dailyStreak});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Daily Streak", style: AppConstants.dailyStreakTitle),
        SizedBox(height: 10),
        Text(dailyStreak.toString(), style: AppConstants.dailyStreakNumber),
        Row(
          children: <Widget>[
            Text("Last 30 Days", style: AppConstants.last30Days),
            SizedBox(width: 10),
            Text("+100%", style: AppConstants.percentageIncrease),
          ],
        ),
      ],
    );
  }
}
