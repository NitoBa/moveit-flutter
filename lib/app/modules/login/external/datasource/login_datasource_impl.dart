import 'package:hasura_connect/hasura_connect.dart';
import 'package:moveitflutter/app/modules/login/infra/models/user_model.dart';

import '../../infra/datasource/i_login_datasource.dart';

class LoginDatasourceImpl implements ILoginDatasource {
  final HasuraConnect _hasuraConnect;

  LoginDatasourceImpl(this._hasuraConnect);
  @override
  Future<UserModel> loginDatasource({String email, String password}) async {
    String loginQuery = """ 
    query Login(\$email: String!, \$password: String!) {
      users(where: {email: {_eq: \$email}, password: {_eq: \$password}}) {
        id
        name
        email
        level
        photo_url
        current_experience
        challenges_completed
      }
    }
    """;

    final response = await _hasuraConnect.query(
      loginQuery,
      variables: {
        "email": email,
        "password": password,
      },
    );

    return UserModel.fromJson(response['data']['users'][0]);
  }
}
