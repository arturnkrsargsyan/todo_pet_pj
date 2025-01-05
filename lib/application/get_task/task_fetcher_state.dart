part of 'task_fetcher_bloc.dart';

abstract class TaskFetcherState extends Equatable {
  const TaskFetcherState();

  @override
  List<Object> get props => [];
}

class TaskFetcherInitial extends TaskFetcherState {}

class TaskFetcherLoading extends TaskFetcherState {}

class TaskFetcherSuccess extends TaskFetcherState {
  final List<TaskToDo> task;

  const TaskFetcherSuccess(this.task);

  @override
  List<Object> get props => [task];
}

class TaskFetcherFailure extends TaskFetcherState {
  final String error;

  const TaskFetcherFailure(this.error);
}
