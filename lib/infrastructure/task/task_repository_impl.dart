import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:todo_app/domain/task_to_do/i_task_repository.dart';
import 'package:todo_app/infrastructure/task/models/to_do.dart';

class TaskRepositoryImpl implements ITaskRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addTask(TaskToDo task) async {
    try {
      await _firestore.collection('task').doc().set(task.toJson());
    } catch (e) {
      throw Exception('Failed to add task: $e');
    }
  }

  @override
  Future<Either<String, List<TaskToDo>>> getTask() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('task').get();
      final List<TaskToDo> tasks = querySnapshot.docs.map((doc) {
        return TaskToDo.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      return Right(tasks);
    } catch (e) {
      return Left('Error: $e');
    }
  }
}
