import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/theme_controller.dart';
import '../../shared/section_card.dart';
import '../tasks/task_controller.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);
    final openTasks = tasks.where((task) => !task.completed).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Guten Morgen'),
        actions: [
          IconButton(
            tooltip: 'Darstellung wechseln',
            onPressed: () => ref.read(themeModeProvider.notifier).toggle(),
            icon: const Icon(Icons.brightness_6_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Text(
            'Alles Wichtige für deine Familie auf einen Blick.',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _Metric(label: 'Offene Aufgaben', value: '$openTasks', icon: Icons.task_alt),
              const _Metric(label: 'Termine heute', value: '2', icon: Icons.event),
              const _Metric(label: 'Familienmitglieder', value: '4', icon: Icons.family_restroom),
            ],
          ),
          const SizedBox(height: 18),
          const SectionCard(
            title: 'Heute',
            icon: Icons.today,
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(child: Icon(Icons.school_outlined)),
                  title: Text('Logopädie'),
                  subtitle: Text('11:00 Uhr · Mara'),
                ),
                Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(child: Icon(Icons.shopping_cart_outlined)),
                  title: Text('Wocheneinkauf'),
                  subtitle: Text('17:30 Uhr · gemeinsam'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const SectionCard(
            title: 'Tipp von Olivia',
            icon: Icons.auto_awesome,
            child: Text(
              'Für heute sind zwei Termine und mehrere Aufgaben geplant. '
              'Plane zwischen 12:00 und 13:00 Uhr bewusst eine ruhige Pause ein.',
            ),
          ),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              CircleAvatar(child: Icon(icon)),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(value, style: Theme.of(context).textTheme.headlineMedium),
                  Text(label),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
