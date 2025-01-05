import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/application/get_task/task_fetcher_bloc.dart';
import 'package:todo_app/presentation/core/router/router.dart';
import 'package:todo_app/presentation/home/widget/custom_button.dart';

@RoutePage()
class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Text('To do task'),
              ],
            ),
            SizedBox(
              height: 200,
              child: BlocBuilder<TaskFetcherBloc, TaskFetcherState>(
                builder: (context, state) {
                  if (state is TaskFetcherLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is TaskFetcherSuccess) {
                    return ListView.builder(
                      itemCount: state.task.length,
                      itemBuilder: (context, index) {
                        final tasks = state.task[index];
                        return SizedBox(
                          height: 80,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Text(tasks.title),
                              Text(tasks.description!),
                              Row(
                                children: [
                                  Text('${tasks.startData.day}'),
                                  Text('${tasks.startData.month}'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('${tasks.endData.day}'),
                                  Text('${tasks.endData.month}'),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else if (state is TaskFetcherFailure) {
                    return Center(child: Text(state.error));
                  }
                  return const Center(child: Text('No tasks available'));
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomButton(
                  buttonText: '+',
                  buttonFunction: () {
                    context.router.push(const TaskAddRoute());
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
