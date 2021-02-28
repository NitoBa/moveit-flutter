import 'package:dartz/dartz.dart';
import 'package:moveitflutter/app/modules/login/domain/entities/user_entity.dart';
import 'package:moveitflutter/app/shared/error/failure.dart';

abstract class ILoginRepository {
  Future<Either<Failure, UserEntity>> loginRepository(
      {String email, String password});

  Future<Either<Failure, String>> registerUserRepository({
    String username,
    String email,
    String password,
    String photoUrl,
  });
}
