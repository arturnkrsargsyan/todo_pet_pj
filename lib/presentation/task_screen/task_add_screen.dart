import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/application/to_do_task/to_do_task_block.dart';
import 'package:todo_app/application/to_do_task/to_do_task_event.dart';
import 'package:todo_app/application/to_do_task/to_do_task_state.dart';
import 'package:todo_app/infrastructure/task/models/to_do.dart';
import 'package:todo_app/presentation/core/router/router.dart';
import 'package:todo_app/presentation/home/widget/button.dart';
import 'package:todo_app/presentation/task_screen/widget/add_text_filed_style.dart';
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
            return Center(
              child: Text('Error: ${state.error}'),
            );
          } else if (state is TaskSuccessfulState) {}

          return Padding(
            padding: const EdgeInsets.all(40),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: const Icon(Icons.close),
                        onTap: () {
                          context.router.push(
                            ToDoRoute(),
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  AddTextFiledStyle(
                    addMaxLines: false,
                    addLabelText: 'Title',
                    addFildValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                    addTextFildController: titleController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  AddTextFiledStyle(
                    addMaxLines: true,
                    addLabelText: 'Note',
                    addFildValidator: (p0) {
                      return null;
                    },
                    addTextFildController: descriptionController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time),
                      InkWell(
                        child: Text('$_startDate'),
                        onTap: () async {
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
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month_sharp),
                      InkWell(
                        child: Text(' $_endDate'),
                        onTap: () async {
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
                    ],
                  ),
                  Spacer(),
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
                        context.router.replace(ToDoRoute());
                      }
                    },
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
