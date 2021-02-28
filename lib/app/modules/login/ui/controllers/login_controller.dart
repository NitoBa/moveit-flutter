import 'package:get/get.dart';
import 'package:moveitflutter/app/modules/login/domain/usecases/login_usecase.dart';

class LoginController extends GetxController {
  final ILoginUsecase _loginUsecase;

  LoginController(this._loginUsecase);
}
