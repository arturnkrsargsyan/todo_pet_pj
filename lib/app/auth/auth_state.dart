import 'package:equatable/equatable.dart';

final class AuthState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class AuthStateStart extends AuthState {}

final class AuthStateInProgress extends AuthState {}

final class AuthStateSuccessful extends AuthState {}

final class AuthStateFailurre extends AuthState {
  final String erorMsg;
  AuthStateFailurre({required this.erorMsg});
}
