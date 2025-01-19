import 'package:flutter/material.dart';
import 'habit.dart';

class HabitTrackScreen extends StatelessWidget {
  final List<Habit> habits;

  HabitTrackScreen({required this.habits});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], 
      appBar: AppBar(
        title: Text('Habit Tracker'),
        backgroundColor: Colors.blue[700], 
      ),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          final habit = habits[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        habit.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800], 
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (int i = 0; i < 7; i++) ...[
                        Column(
                          children: [
                            Text(
                              [
                                'Mon',
                                'Tue',
                                'Wed',
                                'Thu',
                                'Fri',
                                'Sat',
                                'Sun'
                              ][i],
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors
                                      .blue[600]), 
                            ),
                            IconButton(
                              icon: Icon(
                                habit.weeklyCompletion[i]
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                color: habit.weeklyCompletion[i]
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                habit.weeklyCompletion[i] =
                                    !habit.weeklyCompletion[i];
                                habit
                                    .saveHabitCompletion(); 
                              },
                            ),
                          ],
                        ),
                        SizedBox(width: 5), 
                      ]
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}