import 'package:equatable/equatable.dart';

final class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthStateStart extends AuthState {}

final class AuthStateInProgress extends AuthState {}

final class AuthStateSuccessful extends AuthState {}

final class AuthStateFailure extends AuthState {
  final String errorMsg;
  AuthStateFailure({required this.errorMsg});
}
