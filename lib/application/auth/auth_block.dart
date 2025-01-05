import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/application/auth/auth_event.dart';
import 'package:todo_app/application/auth/auth_state.dart';
import 'package:todo_app/domain/auth/i_auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepo;

  AuthBloc(this._authRepo) : super(AuthState()) {
    on<SignUpWhitEmailAndPassword>(_onSignUpWhitEmailAndPassword);
    on<LoginWithEmailAndPassword>(_login);
  }

  Future<void> _onSignUpWhitEmailAndPassword(
    SignUpWhitEmailAndPassword event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthStateStart());

    final response = await _authRepo.signUpWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );

    response.fold(
      (String errorMsg) {
        emit(
          AuthStateFailure(errorMsg: errorMsg),
        );
      },
      (_) {
        emit(
          AuthStateSuccessful(),
        );
      },
    );
  }

  Future<void> _login(
      LoginWithEmailAndPassword event, Emitter<AuthState> emit) async {
    emit(AuthStateInProgress());
    final response = await _authRepo.login(
      email: event.email,
      password: event.password,
    );

    response.fold(
      (String errorMsg) {
        emit(
          AuthStateFailure(
            errorMsg: errorMsg,
          ),
        );
      },
      (_) {
        emit(
          AuthStateSuccessful(),
        );
      },
    );
  }
}
