import 'package:flutter_test/flutter_test.dart';

main() {
  int number;
  setUp(() {
    number = 2;
  });
  test('Should be returned a number', () {
    expect(number, equals(2));
  });
}
