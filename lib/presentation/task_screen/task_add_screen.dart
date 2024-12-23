import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/application/to_do_task/to_do_task_block.dart';
import 'package:todo_app/application/to_do_task/to_do_task_event.dart';
import 'package:todo_app/application/to_do_task/to_do_task_state.dart';
import 'package:todo_app/infrastructure/task/models/to_do.dart';
import 'package:todo_app/presentation/auth/widget/text_field_style.dart';
import 'package:todo_app/presentation/core/router/router.dart';
import 'package:todo_app/presentation/home/widget/button.dart';
import 'package:uuid/uuid.dart';

@RoutePage()
class TaskAddScreen extends StatefulWidget {
  const TaskAddScreen({super.key});

  @override
  State<TaskAddScreen> createState() => _TaskAddScreenState();
}

class _TaskAddScreenState extends State<TaskAddScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  DateTime _startDate = DateTime.now();

  DateTime _endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TaskFailure) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state is TaskSuccessfulState) {
            return const Center(child: Text('Task Added Successfully!'));
          }

          return Padding(
            padding: const EdgeInsets.all(40),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFieldStyle(
                      labelText: 'Title',
                      prefixIconAdd: const Icon(Icons.abc),
                      fildValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                      textFildController: titleController),
                  TextFieldStyle(
                      labelText: 'Description',
                      prefixIconAdd: const Icon(Icons.abc),
                      fildValidator: (p0) {
                        return null;
                      },
                      textFildController: descriptionController),
                  Text('Start Date: $_startDate'),
                  Button(
                    buttonText: ' Start Date',
                    buttonFunction: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: _startDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (newDate != null) {
                        setState(() {
                          _startDate = newDate;
                        });
                      }
                    },
                  ),
                  Text('End Date: $_endDate'),
                  Button(
                    buttonText: 'Set End Date',
                    buttonFunction: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: _endDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (newDate != null) {
                        setState(() {
                          _endDate = newDate;
                        });
                      }
                    },
                  ),
                  Button(
                    buttonText: 'Send',
                    buttonFunction: () async {
                      if (_formKey.currentState!.validate()) {
                        final task = TaskToDo(
                            id: const Uuid().v4(),
                            title: titleController.text,
                            startData: _startDate,
                            isCompleted: false,
                            description: descriptionController.text,
                            endData: _endDate);
                        context.read<TaskBloc>().add(AddTaskTaskEvent(task));
                        context.router.push(const TaskAddRoute());
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
