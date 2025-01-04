import 'package:equatable/equatable.dart';

final class TaskPerformerState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class TaskPerformerInitial extends TaskPerformerState {}

final class TaskPerformerLoading extends TaskPerformerState {}

final class TaskPerformerSuccessful extends TaskPerformerState {}

final class TaskPerformerFailure extends TaskPerformerState {
  final String error;

  TaskPerformerFailure(this.error);
}
