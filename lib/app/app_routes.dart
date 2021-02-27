import 'package:get/get.dart';
import 'package:moveitflutter/app/modules/login/ui/login_binding.dart';
import 'package:moveitflutter/app/modules/login/ui/pages/login_page.dart';

class AppRoutes {
  static const routeTrasitionType = Transition.cupertino;
  static const String initalRoute = '/login';
  static List<GetPage> routes = [_loginRoutes];

  static final _loginRoutes = GetPage(
    name: initalRoute,
    page: () => LoginPage(),
    binding: LoginBinding(),
  );
}
