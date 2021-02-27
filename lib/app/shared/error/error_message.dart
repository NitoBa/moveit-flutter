import 'package:moveitflutter/app/shared/error/failure.dart';

class ErrorMessage implements Failure {
  @override
  String message;

  ErrorMessage({this.message});
}
