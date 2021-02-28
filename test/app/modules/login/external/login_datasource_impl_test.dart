import 'package:flutter_test/flutter_test.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mockito/mockito.dart';
import 'package:moveitflutter/app/modules/login/domain/entities/user_entity.dart';
import 'package:moveitflutter/app/modules/login/external/datasource/login_datasource_impl.dart';
import 'package:moveitflutter/app/modules/login/infra/datasource/i_login_datasource.dart';
import 'package:moveitflutter/app/shared/hasura/custom_hasura.dart';

class HasuraConnectMock extends Mock implements HasuraConnect {}

Map<String, dynamic> jsonData = {
  "data": {
    "users": [
      {
        "id": "1b203f30-ba3b-412e-9418-cfa9c374818c",
        "name": "Bruno",
        "email": "bruno@sthorm.io",
        "level": 0,
        "photo_url": "https://github.com/nitoba.png",
        "current_experience": 0,
        "challenges_completed": 0
      }
    ]
  }
};

void main() {
  CustomHasuraConnect customHasuraConnect;
  HasuraConnect hasuraConnectMock;
  ILoginDatasource loginDatasource;
  setUp(() {
    hasuraConnectMock = HasuraConnectMock();
    customHasuraConnect = CustomHasuraConnect(hasuraConnectMock);
    loginDatasource = LoginDatasourceImpl(customHasuraConnect);
  });

  test("should be return an instance of the LoginDatasource", () {
    expect(loginDatasource, isInstanceOf<LoginDatasourceImpl>());
  });

  test('should be return a UserModel on login when call loginDatasource',
      () async {
    when(
      hasuraConnectMock.query(
        any,
        variables: {
          "email": "valid email",
          "password": "valid password",
        },
      ),
    ).thenAnswer((_) async => jsonData);

    final result = await loginDatasource.loginDatasource(
      email: "valid email",
      password: "valid password",
    );

    expect(result, isNotNull);
    expect(result, isInstanceOf<UserEntity>());
    expect(result.id, equals("1b203f30-ba3b-412e-9418-cfa9c374818c"));
  });
}
