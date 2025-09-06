import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/task.dart';

class FirebaseService {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;

  static Future<void> addTask(DateTime date, String title) async {
    final user = _auth.currentUser;
    final doc = _firestore
        .collection('users')
        .doc(user!.uid)
        .collection('tasks')
        .doc();

    await doc.set({
      'title': title,
      'completed': false,
      'date': date.toIso8601String(),
    });
  }

  static Future<List<Task>> getTasksByDate(DateTime date) async {
    final user = _auth.currentUser;
    final snapshot = await _firestore
        .collection('users')
        .doc(user!.uid)
        .collection('tasks')
        .where('date', isEqualTo: date.toIso8601String())
        .get();

    final tasks = snapshot.docs
        .map((doc) => Task.fromMap(doc.id, doc.data()))
        .toList();

    tasks.sort((a, b) {
      if (a.completed == b.completed) {
        return a.title.toLowerCase().compareTo(b.title.toLowerCase());
      }
      return a.completed ? 1 : -1;
    });

    return tasks;
  }

  static Future<void> toggleTask(Task task) async {
    final user = _auth.currentUser;
    await _firestore
        .collection('users')
        .doc(user!.uid)
        .collection('tasks')
        .doc(task.id)
        .update({'completed': !task.completed});
  }

  static Future<void> deleteTask(Task task) async {
    final user = _auth.currentUser;
    await _firestore
        .collection('users')
        .doc(user!.uid)
        .collection('tasks')
        .doc(task.id)
        .delete();
  }
}
