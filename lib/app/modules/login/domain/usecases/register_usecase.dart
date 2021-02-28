import 'package:crypt/crypt.dart';
import 'package:dartz/dartz.dart';

import '../../../../shared/constants.dart';
import '../../../../shared/error/error_message.dart';
import '../../../../shared/error/failure.dart';
import '../../../../shared/utils/extensions.dart';
import '../repositories/i_login_repository.dart';

abstract class IRegisterUserUsecase {
  String passwordHashed;
  Future<Either<Failure, String>> call({
    String username,
    String email,
    String password,
    String photoUrl,
  });
}

class RegisterUserUsecase implements IRegisterUserUsecase {
  final ILoginRepository repository;
  String passwordHashed;

  RegisterUserUsecase(this.repository);
  @override
  Future<Either<Failure, String>> call({
    String username,
    String email,
    String password,
    String photoUrl,
  }) async {
    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      return Left(
        ErrorMessage(
          message: 'Username, Email and Password are required fields',
        ),
      );
    }

    email = email.trim();
    password = password.trim();
    username = username.trim();

    if (!email.isValidEmail()) {
      return Left(ErrorMessage(message: "Type an email valid"));
    }

    if (!password.isValidPassword()) {
      return Left(
        ErrorMessage(
          message:
              "Your password should be contains between 4 and 12 characters",
        ),
      );
    }

    final hashedPwd = Crypt.sha256(
      password,
      rounds: 4,
      salt: secrectSalt,
    );

    passwordHashed = hashedPwd.hash;

    final result = await repository.registerUserRepository(
      username: username,
      email: email,
      password: passwordHashed,
      photoUrl: photoUrl,
    );

    return result;
  }
}
