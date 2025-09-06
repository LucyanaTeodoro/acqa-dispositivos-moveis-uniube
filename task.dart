class Task {
  final String id;
  final String title;
  final bool completed;
  final DateTime date;

  Task({
    required this.id,
    required this.title,
    required this.completed,
    required this.date,
  });

  factory Task.fromMap(String id, Map<String, dynamic> data) {
    return Task(
      id: id,
      title: data['title'],
      completed: data['completed'],
      date: DateTime.parse(data['date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'completed': completed,
      'date': date.toIso8601String(),
    };
  }
}
