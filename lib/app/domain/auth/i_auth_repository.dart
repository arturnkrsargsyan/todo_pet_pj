import 'package:fpdart/fpdart.dart';

abstract interface class IAuthRepository {
  Future<Either<String, Unit>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<String, Unit>> login({
    required String email,
    required String password,
  });
}
