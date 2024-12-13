// json serializable
class ToDo {
  final String id;
  final String title;
  final DateTime startData;
  final DateTime? endData;
  final String? description;
  final bool isCompleted;

  ToDo({
    required this.id,
    required this.title,
    required this.startData,
    this.endData,
    this.description,
    required this.isCompleted,
  });

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      id: json['id'],
      title: json['title'],
      startData: json['startData'],
      endData: json['endData'],
      description: json['description'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'startData': startData,
      'endData': endData,
      'description': description,
      'isCompleted': isCompleted,
    };
  }
}
