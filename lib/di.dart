import 'package:get_it/get_it.dart';
import 'package:todo_app/application/auth/auth_block.dart';
import 'package:todo_app/domain/auth/i_auth_repository.dart';
import 'package:todo_app/infrastructure/auth/auth_repository_impl.dart';
import 'package:todo_app/auth_repo/auth_repo.dart';

final di = GetIt.instance;
Future<void> initializeDependencies() async {
  di.registerSingleton(
    AuthRepo(),
  );
  di.registerSingleton<IAuthRepository>(
    AuthRepositoryImpl(),
  );

  di.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      di(),
    ),
  );
}
