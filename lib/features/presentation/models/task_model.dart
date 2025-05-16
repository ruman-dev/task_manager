class TaskModel {
  final String? id;
  final String? title;
  final String? description;
  final DateTime? dueDate;
  final bool? isCompleted;

  TaskModel({
    this.id,
    this.title,
    this.description,
    this.dueDate,
    this.isCompleted,
  });

  TaskModel.fromJson(Map<dynamic, dynamic> json)
    : id = json['id'] ?? '',
      title = json['title'] ?? '',
      description = json['description'] ?? '',
      dueDate = DateTime.parse(json['dueDate'] ?? DateTime.now().toString()),
      isCompleted = json['isCompleted'] ?? true;
}
