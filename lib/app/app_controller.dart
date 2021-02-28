import 'package:get/get.dart';
import 'dart:js' as js;

class AppController extends GetxController {
  @override
  Future<void> onInit() async {
    js.context.callMethod("initNotification");
    super.onInit();
  }
}
