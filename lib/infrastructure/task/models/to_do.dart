import 'package:json_annotation/json_annotation.dart';

part 'to_do.g.dart';

@JsonSerializable()
class TaskToDo {
  final String id;
  final String title;
  @JsonKey(name: 'start_data')
  final DateTime startData;
  @JsonKey(name: 'endData')
  final DateTime endData;
  @JsonKey(name: 'description')
  final String? description;
  final bool isCompleted;

  TaskToDo({
    required this.id,
    required this.title,
    required this.startData,
    required this.endData,
    required this.description,
    required this.isCompleted,
  });

  factory TaskToDo.fromJson(Map<String, dynamic> json) =>
      _$TaskToDoFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToDoToJson(this);
}
