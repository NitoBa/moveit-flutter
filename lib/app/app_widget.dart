import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moveitflutter/app/app_routes.dart';

import 'app_binding.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MoveItFlutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: AppBinding(),
      initialRoute: AppRoutes.initalRoute,
      getPages: AppRoutes.routes,
      defaultTransition: AppRoutes.routeTrasitionType,
    );
  }
}
