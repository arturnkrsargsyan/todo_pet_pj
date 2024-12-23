import 'package:equatable/equatable.dart';

final class TaskState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class TaskInitialState extends TaskState {}

final class TaskLoadingState extends TaskState {}

final class TaskSuccessfulState extends TaskState {}

final class TaskFailure extends TaskState {
  final String error;

  TaskFailure(this.error);
}
