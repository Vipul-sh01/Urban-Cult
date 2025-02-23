import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urbancul/Constents/AppConstents.dart';

class StreakCountWidgets extends StatelessWidget {
  final int streakCount;
  const StreakCountWidgets({
    super.key,
    required this.streakCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 110,
      width: 415,
      decoration: BoxDecoration(
        color: AppConstants.boxColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Streak Days", style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          Text(streakCount.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}