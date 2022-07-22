import 'package:dartz/dartz.dart';

import 'value_failures.dart';

/// [validateEmailAddress] checks if email contains '@' sign,
/// is at least 3 characters long and if '@' isn't the last character.
///
/// Whether the email is valid or not, the same input is a part
/// of a return statement, but as different site of [Either].
Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  final lastChar = input.length - 1;

  final hasMinLen = input.length >= 3;
  final hasAtChar = input.contains('@');
  var hasAtCharAsLast = false;
  if (lastChar >= 0 && input[lastChar] == '@') {
    hasAtCharAsLast = true;
  }

  final isValid = hasMinLen && hasAtChar && !hasAtCharAsLast;

  final valueFailure = ValueFailure<String>.invalidEmail(incorrectValue: input);

  return isValid ? right(input) : left(valueFailure);
}

/// [validatePassword] checks if password contains at least 8 and maximum 16 characters,
/// at least one uppercase letter, one lowercase letter, one number and one special character.
///
/// Whether the email is valid or not, the same input it a part of a return statement,
/// but as a different site of [Either].
Either<ValueFailure<String>, String> validatePassword(String input) {
  const passwordRegExp =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$';

  final isValid = RegExp(passwordRegExp).hasMatch(input);
  final valueFailure =
      ValueFailure<String>.invalidPassword(incorrectValue: input);

  return isValid ? right(input) : left(valueFailure);
}

Either<ValueFailure<String>, String> validateUsername(String input) {
  const regExp = r'^(?=.{5,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$';
  final isValid = RegExp(regExp).hasMatch(input);
  final valueFailure =
      ValueFailure<String>.invalidUsername(incorrectValue: input);

  return isValid ? right(input) : left(valueFailure);
}
