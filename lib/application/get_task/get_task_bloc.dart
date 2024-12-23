import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/domain/task_to_do/i_task_repository.dart';
import 'package:todo_app/infrastructure/task/models/to_do.dart';

part 'get_task_event.dart';
part 'get_task_state.dart';

class GetTaskBloc extends Bloc<GetTaskEvent, GetTaskState> {
  final ITaskRepository taskRepository;

  GetTaskBloc(this.taskRepository) : super(GetTaskInitial()) {
    on<FetchTasks>(getTasks);
  }

  Future<void> getTasks(FetchTasks event, Emitter<GetTaskState> emit) async {
    emit(GetTaskInitial());

    final response = await taskRepository.getTask();
    response.fold((errorMsg) {
      emit(
        GetTaskFailure(
          errorMsg,
        ),
      );
    }, (tasks) {
      emit(
        GetTaskSuccess(
          tasks,
        ),
      );
    });
  }
}
