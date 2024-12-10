class ToDo {
  final String id;
  final String title;
  final DateTime start_data;
  final DateTime? end_data;
  final String? description;
  final bool isCompleted;
  ToDo({
    required this.id,
    required this.title,
    required this.start_data,
    this.end_data,
    this.description,
    required this.isCompleted,
  });
  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      id: json['id'],
      title: json['title'],
      start_data: json['startDate'],
      end_data: json['endDate'],
      description: json['description'],
      isCompleted: json['isCompleted'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'start_data': start_data,
      'end_data': end_data,
      'description': description,
      'isCompleted': isCompleted,
    };
  }
}
