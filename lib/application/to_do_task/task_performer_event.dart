import 'package:flutter/material.dart';
import 'package:todo_app/infrastructure/task/models/to_do.dart';

@immutable
class TaskPerformerEvent {}

class AddTaskPerformerEvent extends TaskPerformerEvent {
  final TaskToDo task;

  AddTaskPerformerEvent(this.task);
}
