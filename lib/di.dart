import 'package:get_it/get_it.dart';
import 'package:todo_app/application/auth/auth_block.dart';
import 'package:todo_app/application/get_task/get_task_bloc.dart';
import 'package:todo_app/application/to_do_task/to_do_task_block.dart';
import 'package:todo_app/domain/auth/i_auth_repository.dart';
import 'package:todo_app/domain/task_to_do/i_task_repository.dart';
import 'package:todo_app/infrastructure/auth/auth_repository_impl.dart';

import 'package:todo_app/infrastructure/task/task_repository_impl.dart';

final di = GetIt.instance;
Future<void> initializeDependencies() async {
  di.registerSingleton<IAuthRepository>(
    AuthRepositoryImpl(),
  );

  di.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      di<IAuthRepository>(),
    ),
  );

  di.registerSingleton<ITaskRepository>(
    TaskRepositoryImpl(),
  );

  di.registerLazySingleton<TaskBloc>(
    () => TaskBloc(
      di<ITaskRepository>(),
    ),
  );

  di.registerLazySingleton<GetTaskBloc>(
    () => GetTaskBloc(
      di<ITaskRepository>(),
    ),
  );
}
