import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/auth/auth_block.dart';
import 'package:todo_app/lc.dart';
import 'package:todo_app/presentation/core/router/router.dart';

class Todo extends StatelessWidget {
  const Todo({super.key});
  static final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => lc<AuthBloc>(),
      child: MaterialApp.router(
        title: 'Todo App',
        routerConfig: appRouter.config(),
      ),
    );
  }
}