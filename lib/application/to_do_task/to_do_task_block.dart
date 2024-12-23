import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/task_to_do/i_task_repository.dart';
import 'to_do_task_event.dart';
import 'to_do_task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final ITaskRepository taskRepository;

  TaskBloc(this.taskRepository) : super(TaskInitialState()) {
    on<AddTaskTaskEvent>(_onAddTask);
  }

  Future<void> _onAddTask(
      AddTaskTaskEvent event, Emitter<TaskState> emit) async {
    emit(TaskLoadingState());
    try {
      await taskRepository.addTask(event.task);
      emit(TaskSuccessfulState());
    } catch (e) {
      emit(TaskFailure(e.toString()));
    }
  }
}
