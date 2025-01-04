part of 'task_fetcher_bloc.dart';

abstract class TaskFetcherEvent extends Equatable {
  const TaskFetcherEvent();

  @override
  List<Object> get props => [];
}

class FetchTasks extends TaskFetcherEvent {}
