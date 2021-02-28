import 'package:dartz/dartz.dart';
import 'package:moveitflutter/app/shared/error/failure.dart';

abstract class IRegisterUserUsecase {
  Future<Either<Failure, String>> call({
    String username,
    String email,
    String password,
    String photoUrl,
  });
}

class RegisterUserUsecase implements IRegisterUserUsecase {
  @override
  Future<Either<Failure, String>> call({
    String username,
    String email,
    String password,
    String photoUrl,
  }) async {}
}
