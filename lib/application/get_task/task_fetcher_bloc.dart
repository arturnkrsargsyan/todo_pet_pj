import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/domain/task_to_do/i_task_repository.dart';
import 'package:todo_app/infrastructure/task/models/to_do.dart';

part 'task_fetcher_event.dart';
part 'task_fetcher_state.dart';

class TaskFetcherBloc extends Bloc<TaskFetcherEvent, TaskFetcherState> {
  final ITaskRepository taskRepository;

  TaskFetcherBloc(this.taskRepository) : super(TaskFetcherInitial()) {
    on<FetchTasks>(fetchTasks);
  }

  Future<void> fetchTasks(
      FetchTasks event, Emitter<TaskFetcherState> emit) async {
    emit(TaskFetcherInitial());

    final response = await taskRepository.fetchTask();
    response.fold((errorMsg) {
      emit(
        TaskFetcherFailure(
          errorMsg,
        ),
      );
    }, (tasks) {
      emit(
        TaskFetcherSuccess(
          tasks,
        ),
      );
    });
  }
}
