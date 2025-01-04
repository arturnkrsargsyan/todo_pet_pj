import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/task_to_do/i_task_repository.dart';
import 'task_performer_event.dart';
import 'task_performer_state.dart';

class TaskPerformerBloc extends Bloc<TaskPerformerEvent, TaskPerformerState> {
  final ITaskRepository taskRepository;

  TaskPerformerBloc(this.taskRepository) : super(TaskPerformerInitial()) {
    on<AddTaskPerformerEvent>(_onAddTask);
  }

  Future<void> _onAddTask(
      AddTaskPerformerEvent event, Emitter<TaskPerformerState> emit) async {
    emit(TaskPerformerLoading());
    try {
      await taskRepository.addTask(event.task);
      emit(TaskPerformerSuccessful());
    } catch (e) {
      emit(TaskPerformerFailure(e.toString()));
    }
  }
}
