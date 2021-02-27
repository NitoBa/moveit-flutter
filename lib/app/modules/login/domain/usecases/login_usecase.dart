import 'package:dartz/dartz.dart';

import '../../../../shared/constants.dart';
import '../../../../shared/error/error_message.dart';
import '../../../../shared/error/failure.dart';
import '../entities/user_entity.dart';
import '../repositories/i_login_repository.dart';

abstract class ILoginUsecase {
  Future<Either<Failure, UserEntity>> call({
    String email,
    String password,
  });
}

class LoginUsecase implements ILoginUsecase {
  final ILoginRepository _loginRepository;

  LoginUsecase(this._loginRepository);
  @override
  Future<Either<Failure, UserEntity>> call({
    String email,
    String password,
  }) async {
    bool isValideEmail = RegExp(regexValidateEmail).hasMatch(email);

    if (!isValideEmail) {
      return Left(ErrorMessage(message: 'Type an email valid'));
    }

    final result = await _loginRepository.loginRepository(
      email: email,
      password: password,
    );
    return result;
  }
}
