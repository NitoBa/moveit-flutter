import 'package:get/get.dart';
import 'package:moveitflutter/app/shared/hasura/custom_hasura.dart';
import 'package:moveitflutter/app/shared/services/local_storage/i_local_storage.dart';
import 'package:moveitflutter/app/shared/services/local_storage/local_storage_impl.dart';

import 'app_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILocalStorage>(() => SharedPrefs());
    Get.put<CustomHasuraConnect>(CustomHasuraConnect(), permanent: true);
    Get.put(AppController(), permanent: true);
  }
}
