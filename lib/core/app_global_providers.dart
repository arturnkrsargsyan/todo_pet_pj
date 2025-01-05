import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/auth/auth_block.dart';
import '../application/get_task/task_fetcher_bloc.dart';
import '../application/to_do_task/task_performer_block.dart';
import '../di.dart';
import 'app.dart';

class AppGlobalProviders extends StatelessWidget {
  const AppGlobalProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(di()),
        ),
        BlocProvider<TaskPerformerBloc>(
          create: (BuildContext context) => TaskPerformerBloc(di()),
        ),
        BlocProvider<TaskFetcherBloc>(
          create: (BuildContext context) => TaskFetcherBloc(di()),
        ),
      ],
      child: const Todo(),
    );
  }
}
