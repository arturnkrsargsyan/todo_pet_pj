import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/application/app.dart';
import 'package:todo_app/application/auth/auth_block.dart';
import 'package:todo_app/application/get_task/get_task_bloc.dart';
import 'package:todo_app/application/to_do_task/to_do_task_block.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/di.dart';

Future<void> runAndInitialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthBloc>(
      create: (BuildContext context) => AuthBloc(di()),
    ),
    BlocProvider<TaskBloc>(
      create: (BuildContext context) => TaskBloc(di()),
    ),
    BlocProvider<GetTaskBloc>(
      create: (BuildContext context) => GetTaskBloc(di()),
    ),
  ], child: const Todo()));
}
