import 'package:fpdart/fpdart.dart';
import 'package:todo_app/infrastructure/task/models/to_do.dart';

abstract interface class ITaskRepository {
  Future<void> addTask(TaskToDo task);

  Future<Either<String, List<TaskToDo>>> fetchTask();
}
