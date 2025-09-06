import 'package:app_lucyana/screens/add_task_dialog.dart';
import 'package:app_lucyana/screens/task_item.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/firebase_service.dart';
import 'package:intl/intl.dart';

class TaskScreen extends StatefulWidget {
  final DateTime date;
  const TaskScreen({super.key, required this.date});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final tasks = await FirebaseService.getTasksByDate(widget.date);
    setState(() {
      _tasks = tasks;
    });
  }

  void _addTask(String title) async {
    await FirebaseService.addTask(widget.date, title);
    _loadTasks();
  }

  void _toggleTask(Task task) async {
    await FirebaseService.toggleTask(task);
    _loadTasks();
  }

  void _deleteTask(Task task) async {
    await FirebaseService.deleteTask(task);
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd/MM/yyyy').format(widget.date);

    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text("Dia $formattedDate"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: _tasks
                  .map(
                    (task) => TaskItem(
                      task: task,
                      onToggle: () => _toggleTask(task),
                      onDelete: () => _deleteTask(task),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () => showDialog(
          context: context,
          builder: (_) => AddTaskDialog(onSubmit: _addTask),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
