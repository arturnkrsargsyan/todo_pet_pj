import 'package:flutter/material.dart';
import 'package:todo_app/infrastructure/task/models/to_do.dart';

@immutable
class TaskEvent {}

class AddTaskTaskEvent extends TaskEvent {
  final TaskToDo task;

  AddTaskTaskEvent(this.task);
}
