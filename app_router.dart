class FamilyTask {
  const FamilyTask({
    required this.id,
    required this.title,
    required this.assignee,
    this.completed = false,
  });

  final String id;
  final String title;
  final String assignee;
  final bool completed;

  FamilyTask copyWith({bool? completed}) => FamilyTask(
        id: id,
        title: title,
        assignee: assignee,
        completed: completed ?? this.completed,
      );
}
