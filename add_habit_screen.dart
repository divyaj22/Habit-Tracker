import 'package:flutter/material.dart';
import 'habit.dart';

class AddHabitScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Habit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Habit Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String habitName = nameController.text;
                if (habitName.isNotEmpty) {
                  // Return the new habit name to the HomeScreen
                  Navigator.pop(
                    context,
                    Habit(name: habitName, weeklyCompletion: [
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false
                    ]),
                  );
                }
              },
              child: Text('Add Habit'),
            ),
          ],
        ),
      ),
    );
  }
}