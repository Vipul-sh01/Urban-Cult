import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbancul/Views/HomeScreen.dart';
import '../Constents/AppConstents.dart';
import '../ViewModels/SkinCareViewsModels.dart';
import '../Widgets/BottomBar.dart';
import '../Widgets/ButtonWidgets.dart';
import '../Widgets/DailyStreakWidgets.dart';
import '../Widgets/GraphWidgets.dart';
import '../Widgets/StreakCountWidgets.dart';

class StreakScreens extends StatelessWidget {
  StreakScreens({super.key});

  final SkincareController controller = Get.put(SkincareController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.streakTitle, style: AppConstants.appBarTextStyle),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(AppConstants.todayGoal, style: AppConstants.goalTextStyle),
            SizedBox(height: 20),
            Obx(() => StreakCountWidgets(streakCount: controller.streakCount.value)),
            SizedBox(height: 20),
            Obx(() => DailyStreakWidgets(dailyStreak: controller.streakCount.value,)),
            SizedBox(height: 20),
            GraphWidgets(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: AppConstants.graphLabels.map((label) {
                return Text(label, style: TextStyle(fontSize: 14));
              }).toList(),
            ),
            SizedBox(height: 30),
            Text(AppConstants.keepItUp, style: AppConstants.keepTextStyle),
            SizedBox(height: 30),
            ButtonWidgets(onTap: () {
              Get.off(HomeScreen());
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
