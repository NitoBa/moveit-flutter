import 'package:get/get.dart';
import 'package:moveitflutter/app/shared/hasura/custom_hasura.dart';

import 'app_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CustomHasuraConnect>(CustomHasuraConnect(), permanent: true);
    Get.put(AppController(), permanent: true);
  }
}
