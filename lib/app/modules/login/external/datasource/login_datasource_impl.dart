import '../../../../shared/hasura/custom_hasura.dart';
import '../../infra/datasource/i_login_datasource.dart';
import '../../infra/models/user_model.dart';

class LoginDatasourceImpl implements ILoginDatasource {
  final CustomHasuraConnect _customHasuraConnect;

  LoginDatasourceImpl(this._customHasuraConnect);
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

    final response = await _customHasuraConnect.hasura.query(
      loginQuery,
      variables: {
        "email": email,
        "password": password,
      },
    );

    return UserModel.fromJson(response['data']['users'][0]);
  }
}
