import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moveitflutter/app/modules/login/domain/entities/user_entity.dart';
import 'package:moveitflutter/app/modules/login/domain/repositories/i_login_repository.dart';
import 'package:moveitflutter/app/modules/login/infra/datasource/i_login_datasource.dart';
import 'package:moveitflutter/app/modules/login/infra/models/user_model.dart';
import 'package:moveitflutter/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:moveitflutter/app/shared/error/error_message.dart';
import 'package:moveitflutter/app/shared/error/failure.dart';

class LoginDatasourceMock extends Mock implements ILoginDatasource {}

void main() {
  ILoginRepository loginRepository;
  ILoginDatasource loginDatasource;

  setUp(() {
    loginDatasource = LoginDatasourceMock();
    loginRepository = LoginRepositoryImpl(loginDatasource);
  });

  test('should return an user on login', () async {
    UserEntity userEntity;

    when(loginDatasource.loginDatasource(
      email: "valid email",
      password: "valid password",
    )).thenAnswer(
      (_) async => UserModel(id: "123456"),
    );

    final result = await loginRepository.loginRepository(
      email: "valid email",
      password: "valid password",
    );

    result.fold((l) => null, (r) => userEntity = r);

    expect(result.isRight(), isTrue);
    expect(userEntity, isInstanceOf<UserEntity>());
    expect(userEntity.id, equals("123456"));
  });

  test('should return an error on login with invalid email or invalid password',
      () async {
    Failure error;

    when(loginDatasource.loginDatasource(
      email: "invalid email",
      password: "invalid password",
    )).thenThrow(Exception());

    final result = await loginRepository.loginRepository(
      email: "invalid email",
      password: "invalid password",
    );

    result.fold((l) => error = l, (r) => null);

    expect(result.isLeft(), isTrue);
    expect(error, isInstanceOf<ErrorMessage>());
    expect(error.message, equals("Error at login"));
  });
}
