import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constents/AppConstents.dart';
import '../ViewModels/NavController.dart';

class BottomNavBar extends StatelessWidget {
  final NavController controller = Get.put(NavController());

  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
      currentIndex: controller.selectedIndex.value,
      onTap: controller.changeIndex,
      selectedItemColor: AppConstants.secondaryTextColor,
      unselectedItemColor: AppConstants.secondaryTextColor.withOpacity(0.6),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.checklist), label: AppConstants.routine),
        BottomNavigationBarItem(icon: Icon(Icons.local_fire_department), label: AppConstants.streaks),
      ],
    ));
  }
}
