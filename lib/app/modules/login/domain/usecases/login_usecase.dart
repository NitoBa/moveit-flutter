import 'package:crypt/crypt.dart';
import 'package:dartz/dartz.dart';
import 'package:moveitflutter/app/shared/constants.dart';
import '../../../../shared/error/error_message.dart';
import '../../../../shared/error/failure.dart';
import '../entities/user_entity.dart';
import '../repositories/i_login_repository.dart';
import '../../../../shared/utils/extensions.dart';

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
    if (email.isEmpty || password.isEmpty) {
      return Left(
        ErrorMessage(message: 'Email and Password are required fields'),
      );
    }

    email = email.trim();
    password = password.trim();

    if (!email.isValidEmail()) {
      return Left(ErrorMessage(message: 'Type an email valid'));
    }

    if (!password.isValidPassword()) {
      return Left(
        ErrorMessage(
          message:
              'Your password should be contains between 4 and 12 characters',
        ),
      );
    }

    final hashedPwd = Crypt.sha256(
      password,
      rounds: 4,
      salt: secrectSalt,
    );

    final result = await _loginRepository.loginRepository(
      email: email,
      password: hashedPwd.hash,
    );

    return result;
  }
}
