part of 'get_task_bloc.dart';

abstract class GetTaskEvent extends Equatable {
  const GetTaskEvent();

  @override
  List<Object> get props => [];
}

class FetchTasks extends GetTaskEvent {}
