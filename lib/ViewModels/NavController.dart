import 'package:get/get.dart';

import '../Views/StreaksScreens.dart';
import 'SkinCareViewsModels.dart';

class NavController extends GetxController {
  final SkincareController controller = Get.put(SkincareController());
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;

    // Navigate based on index
    switch (index) {
      case 0:
        controller.logRoutine("user_id");
        break;
      case 1:
        Get.to(StreakScreens());
        break;
    }
  }
}
