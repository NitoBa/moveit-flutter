import 'package:moveitflutter/app/modules/login/infra/models/user_model.dart';

abstract class ILoginDatasource {
  Future<UserModel> loginDatasource({String email, String password});
}
