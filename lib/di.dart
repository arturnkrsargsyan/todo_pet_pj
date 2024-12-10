import 'package:get_it/get_it.dart';
import 'package:todo_app/application/auth/auth_block.dart';
import 'package:todo_app/domain/auth/i_auth_repository.dart';
import 'package:todo_app/infrastructure/auth/auth_repositoy_impl.dart';
import 'package:todo_app/auth_repo/auth_repo.dart';

// di
final lc = GetIt.instance;
Future<void> initializeDependencies() async {
  lc.registerSingleton(
    AuthRepo(),
  );
  lc.registerSingleton<IAuthRepository>(
    AuthRepositoryImpl(),
  );

  lc.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      lc(),
    ),
  );
}
