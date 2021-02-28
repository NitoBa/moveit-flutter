import 'package:get/get.dart';
import 'package:moveitflutter/app/modules/login/ui/login_binding.dart';
import 'package:moveitflutter/app/modules/login/ui/pages/login_page.dart';

import 'modules/login/ui/pages/register_page.dart';

class AppRoutes {
  static const routeTrasitionType = Transition.cupertino;
  static const String initalRoute = '/login';
  static List<GetPage> routes = [_loginRoutes];

  static final _loginRoutes = GetPage(
    name: initalRoute,
    page: () => LoginPage(),
    binding: LoginBinding(),
    children: [
      GetPage(
        name: "/register",
        page: () => RegisterPage(),
      ),
    ],
  );
}
