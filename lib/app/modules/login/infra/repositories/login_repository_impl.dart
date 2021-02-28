import 'package:hasura_connect/hasura_connect.dart';
import 'package:moveitflutter/app/modules/login/infra/datasource/i_login_datasource.dart';
import 'package:moveitflutter/app/shared/error/error_message.dart';
import 'package:moveitflutter/app/shared/error/failure.dart';

import 'package:moveitflutter/app/modules/login/domain/entities/user_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/i_login_repository.dart';

class LoginRepositoryImpl implements ILoginRepository {
  final ILoginDatasource _datasource;

  LoginRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, UserEntity>> loginRepository(
      {String email, String password}) async {
    try {
      final result =
          await _datasource.loginDatasource(email: email, password: password);

      return Right(result);
    } catch (e) {
      print(e);
      return Left(
        ErrorMessage(message: "Error, email or password invalids"),
      );
    }
  }
}
