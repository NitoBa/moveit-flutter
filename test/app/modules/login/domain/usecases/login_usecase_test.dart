import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moveitflutter/app/modules/login/domain/entities/user_entity.dart';
import 'package:moveitflutter/app/modules/login/domain/repositories/i_login_repository.dart';
import 'package:moveitflutter/app/modules/login/domain/usecases/login_usecase.dart';
import 'package:moveitflutter/app/shared/error/error_message.dart';
import 'package:moveitflutter/app/shared/error/failure.dart';

class LoginRepositoryMock extends Mock implements ILoginRepository {}

void main() {
  ILoginRepository repository;
  ILoginUsecase usecase;
  setUp(() {
    repository = LoginRepositoryMock();
    usecase = LoginUsecase(repository);
  });

  test(
    'should be return an user on login with email and password is correct',
    () async {
      UserEntity userEntity;
      when(repository.loginRepository(
        email: "bruno@gmail.com",
        password: "LzPGGl7oYsNgREhBcwSVuaZCUiHMmH.oTjP.eZrhbd3",
      )).thenAnswer(
        (_) async => Right(UserEntity(id: "123456")),
      );

      final result = await usecase(
        email: "bruno@gmail.com",
        password: "password",
      );

      result.fold((l) => null, (r) => userEntity = r);

      expect(result.isRight(), isTrue);
      expect(userEntity, isInstanceOf<UserEntity>());
      expect(userEntity.id, equals('123456'));
    },
  );

  test(
    'should be return an error on login when password is incorrect',
    () async {
      Failure error;
      when(
        repository.loginRepository(
          email: "bruno@gmail.com",
          password: "1anp2929xaw6nU6Vgs35Q164rIImjA2ZSq6bEyNv4F.",
        ),
      ).thenAnswer(
        (_) async => Left(ErrorMessage(message: "Error, incorrect password")),
      );

      final result = await usecase(
        email: "bruno@gmail.com",
        password: "incorrect",
      );

      result.fold((l) => error = l, (r) => null);

      expect(result.isLeft(), isTrue);
      expect(error, isInstanceOf<ErrorMessage>());
      expect(error.message, equals('Error, incorrect password'));
    },
  );

  test(
    'should be return an error on login when an email invalid',
    () async {
      Failure error;

      final result = await usecase(
        email: "invalid email",
        password: "password",
      );

      result.fold((l) => error = l, (r) => null);

      expect(result.isLeft(), isTrue);
      expect(error, isInstanceOf<ErrorMessage>());
      expect(error.message, equals('Type an email valid'));
    },
  );

  test(
    'should be return an error on login when an is password has too much or title characters',
    () async {
      Failure error;

      final resultTooMuch = await usecase(
        email: "bruno@gmail.com",
        password: "abc",
      );

      resultTooMuch.fold((l) => error = l, (r) => null);

      expect(resultTooMuch.isLeft(), isTrue);
      expect(error, isInstanceOf<ErrorMessage>());
      expect(
        error.message,
        equals('Your password should be contains between 4 and 12 characters'),
      );

      final resultTitle = await usecase(
        email: "bruno@gmail.com",
        password: "1234567891022",
      );

      resultTitle.fold((l) => error = l, (r) => null);

      expect(resultTitle.isLeft(), isTrue);
      expect(error, isInstanceOf<ErrorMessage>());
      expect(
        error.message,
        equals('Your password should be contains between 4 and 12 characters'),
      );
    },
  );
}
