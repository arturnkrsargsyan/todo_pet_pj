part of 'get_task_bloc.dart';

abstract class GetTaskState extends Equatable {
  const GetTaskState();

  @override
  List<Object> get props => [];
}

class GetTaskInitial extends GetTaskState {}

class GetTaskLoading extends GetTaskState {}

class GetTaskSuccess extends GetTaskState {
  final List<TaskToDo> task;

  const GetTaskSuccess(this.task);

  @override
  List<Object> get props => [task];
}

class GetTaskFailure extends GetTaskState {
  final String error;

  const GetTaskFailure(this.error);
}
