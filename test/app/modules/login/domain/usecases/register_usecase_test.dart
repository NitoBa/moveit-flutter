import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moveitflutter/app/modules/login/domain/repositories/i_login_repository.dart';
import 'package:moveitflutter/app/modules/login/domain/usecases/register_usecase.dart';
import 'package:moveitflutter/app/shared/error/failure.dart';

class LoginRepositoryMock extends Mock implements ILoginRepository {}

void main() {
  ILoginRepository repositoryMock;
  IRegisterUserUsecase usecase;
  setUp(() {
    repositoryMock = LoginRepositoryMock();
    usecase = RegisterUserUsecase(repositoryMock);
  });

  test("should return an error if email, password or username is empty",
      () async {
    Failure error;
    final result = await usecase(email: "", username: "", password: "");

    result.fold((l) => error = l, (r) => null);

    expect(result.isLeft(), isTrue);
    expect(error.message, "Username, Email and Password are required fields");
  });

  test("should return an error if email is invalid", () async {
    Failure error;
    final result = await usecase(
      email: "invalid email",
      password: "valid password",
      username: "valid username",
    );

    result.fold((l) => error = l, (r) => null);

    expect(result.isLeft(), isTrue);
    expect(error.message, "Type an email valid");
  });

  test("should return an error if password is invalid", () async {
    Failure error;
    final result = await usecase(
      password: "abc",
      email: "bruno@gmail.com",
      username: "username",
    );

    result.fold((l) => error = l, (r) => null);

    expect(result.isLeft(), isTrue);
    expect(
      error.message,
      "Your password should be contains between 4 and 12 characters",
    );

    final result2 = await usecase(
      password: "abcasdasdasdasdasdasdasdasd",
      email: "bruno@gmail.com",
      username: "username",
    );

    result2.fold((l) => error = l, (r) => null);

    expect(result2.isLeft(), isTrue);
    expect(
      error.message,
      "Your password should be contains between 4 and 12 characters",
    );
  });

  test('should return an user id when the register usecase was called',
      () async {
    String userId;
    when(repositoryMock.registerUserRepository(
      username: "username",
      email: "bruno@gmail.com",
      password: "LzPGGl7oYsNgREhBcwSVuaZCUiHMmH.oTjP.eZrhbd3",
      photoUrl: "https://meuprofile.png",
    )).thenAnswer((_) async => Right('idasds-dasda-asdasd-asdas'));

    final result = await usecase(
      username: "username",
      email: "bruno@gmail.com",
      password: "password",
      photoUrl: "https://meuprofile.png",
    );

    result.fold((l) => null, (r) => userId = r);

    expect(result.isRight(), isTrue);
    expect(userId, equals("idasds-dasda-asdasd-asdas"));
  });
}
