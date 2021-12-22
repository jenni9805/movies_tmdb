import 'package:flutter_test/flutter_test.dart';
import 'package:movies_v2/src/model/login/validation.dart';

void main() {
  group('Validation Email', () {
    test('Email is Empty', () {
      var result = Validation.validateEmail('');
      expect(result, 'Enter email!');
    });

    test('Email is invalid', () {
      var result = Validation.validateEmail('jenni@gmail');
      expect(result, 'Enter valid Email!');
    });

    test('Email is success', () {
      var result = Validation.validateEmail('jhshahs@gmail.com');
      expect(result, '');
    });

  });

  group('Validation password', (){
    test('Password is Empty', () {
      var result = Validation.validatePassword('');
      expect(result, 'Enter password');
    });

    test('Password is invalid', () {
      var result = Validation.validatePassword('12345');
      expect(result, 'Password must be more than 6 characters');
    });

    test('Password success', (){
      var result = Validation.validatePassword('1234567');
      expect(result, '');
    });
  });
}
