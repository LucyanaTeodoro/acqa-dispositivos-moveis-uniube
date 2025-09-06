import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDate = DateTime.now();

  void _goToTaskScreen(DateTime date) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => TaskScreen(date: date)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: const Text('Bem-vinda, Lucyana!'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020),
            lastDay: DateTime.utc(2100),
            focusedDay: _selectedDate,
            selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
            onDaySelected: (selectedDay, _) {
              setState(() => _selectedDate = selectedDay);
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _goToTaskScreen(_selectedDate),
            child: const Text("Selecionar o dia"),
          ),
        ],
      ),
    );
  }
}
