import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/application/get_task/get_task_bloc.dart';
import 'package:todo_app/presentation/to_do_page/widget/task_tail.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTaskBloc, GetTaskState>(
      builder: (context, state) {
        if (state is GetTaskLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetTaskSuccess) {
          return ListView.builder(
            itemCount: state.task.length,
            itemBuilder: (context, index) {
              final tasks = state.task[index];
              return TaskTail(
                tailTitle: tasks.title,
                tailDescription: '${tasks.description}',
                tailDayStartData: '${tasks.startData.day}',
                tailMonthStartData: '${tasks.startData.month}',
                tailDayEndData: '${tasks.endData.day}',
                tailMonthEndData: '${tasks.endData.month}',
              );
            },
          );
        } else if (state is GetTaskFailure) {
          return Center(child: Text(state.error));
        }
        return const Center(child: Text('No tasks available'));
      },
    );
  }
}
