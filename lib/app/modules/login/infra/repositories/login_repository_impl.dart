import 'package:dartz/dartz.dart';

import '../../../../shared/error/error_message.dart';
import '../../../../shared/error/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/i_login_repository.dart';
import '../datasource/i_login_datasource.dart';

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

  @override
  Future<Either<Failure, String>> registerUserRepository({
    String username,
    String email,
    String password,
    String photoUrl,
  }) async {}
}
