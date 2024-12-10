import 'package:flutter/foundation.dart';

@immutable
final class AuthEvent {}

final class SignUpWhitEmailAndPassword extends AuthEvent {
  final String email;
  final String password;
  SignUpWhitEmailAndPassword(this.email, this.password);
}

final class LoginWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;
  LoginWithEmailAndPassword(this.email, this.password);
}
