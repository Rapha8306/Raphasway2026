import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'task.dart';

class TaskController extends Notifier<List<FamilyTask>> {
  @override
  List<FamilyTask> build() => const [
        FamilyTask(id: '1', title: 'Einkaufsliste prüfen', assignee: 'Raphael'),
        FamilyTask(id: '2', title: 'Kindergartentasche vorbereiten', assignee: 'Familie'),
        FamilyTask(id: '3', title: 'Rechnung ablegen', assignee: 'Raphael', completed: true),
      ];

  void toggle(String id) {
    state = [
      for (final task in state)
        if (task.id == id)
          task.copyWith(completed: !task.completed)
        else
          task,
    ];
  }

  void add(String title, String assignee) {
    state = [
      ...state,
      FamilyTask(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        title: title,
        assignee: assignee,
      ),
    ];
  }
}

final taskProvider =
    NotifierProvider<TaskController, List<FamilyTask>>(TaskController.new);
