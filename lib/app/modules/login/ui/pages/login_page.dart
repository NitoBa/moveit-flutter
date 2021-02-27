import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moveitflutter/app/shared/size_config.dart';

import '../controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig();
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginPage'),
      ),
      body: Container(),
    );
  }
}
