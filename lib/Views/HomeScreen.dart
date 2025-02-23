import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/BottomBar.dart';
import '../Widgets/RoutineItem.dart';
import '../Constents/AppConstents.dart';
import '../ViewModels/SkinCareViewsModels.dart';

class HomeScreen extends StatelessWidget {
  final SkincareController controller = Get.put(SkincareController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.appTitle, style: AppConstants.appBarTextStyle),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Obx(() => RoutineItemTile(
            text: AppConstants.cleanser,
            disText: AppConstants.cleanserDetails,
            time: controller.currentTime.value,
            isChecked: controller.faceWash.value,
            onPressed: () {
              controller.faceWash.toggle();
            },
          )),
          Obx(() => RoutineItemTile(
            text: AppConstants.toner,
            disText: AppConstants.tonerDetails,
            time: controller.currentTime.value,
            isChecked: controller.toner.value,
            onPressed: () {
              controller.toner.toggle();
            },
          )),
          Obx(() => RoutineItemTile(
            text: AppConstants.moisturizer,
            disText: AppConstants.moisturizerDetails,
            time: controller.currentTime.value,
            isChecked: controller.moisturizer.value,
            onPressed: () {
              controller.moisturizer.toggle();
            },
          )),
          Obx(() => RoutineItemTile(
            text: AppConstants.sunscreen,
            disText: AppConstants.sunscreenDetails,
            time: controller.currentTime.value,
            isChecked: controller.sunscreen.value,
            onPressed: () {
              controller.sunscreen.toggle();
            },
          )),
          Obx(() => RoutineItemTile(
            text: AppConstants.lipBalm,
            disText: AppConstants.lipBalmDetails,
            time: controller.currentTime.value,
            isChecked: controller.lipBalm.value,
            onPressed: () {
              controller.lipBalm.toggle();
            },
          )),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
