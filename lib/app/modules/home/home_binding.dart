import 'package:get/get.dart';
import 'package:moveitflutter/app/modules/home/ui/controllers/home_controller.dart';
import 'package:moveitflutter/app/shared/services/local_storage/i_local_storage.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(
        Get.find<ILocalStorage>(),
      ),
    );
  }
}
