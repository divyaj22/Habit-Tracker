import 'package:flutter/material.dart';
import 'habit.dart'; // Make sure Habit class is imported here
import 'add_habit_screen.dart'; // Make sure AddHabitScreen is imported
import 'habit_track.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Habit> habits = [
    Habit(
        name: 'Drink Water',
        weeklyCompletion: [false, false, false, false, false, false, false]),
    Habit(
        name: 'Exercise',
        weeklyCompletion: [false, false, false, false, false, false, false]),
  ];

  @override
  void initState() {
    super.initState();
    _loadHabitCompletionStatus();
  }

  // Load saved habit completion status from SharedPreferences
  _loadHabitCompletionStatus() async {
    for (var habit in habits) {
      List<bool> completionStatus = await habit.loadHabitCompletion();
      setState(() {
        habit.weeklyCompletion = completionStatus;
      });
    }
  }

  // Toggle completion status for a habit and save it
  void toggleHabitCompletion(int habitIndex, int dayIndex) async {
    setState(() {
      habits[habitIndex].weeklyCompletion[dayIndex] =
          !habits[habitIndex].weeklyCompletion[dayIndex];
    });
    await habits[habitIndex]
        .saveHabitCompletion(); // Save updated completion status
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], // Light blue background for HomeScreen
      appBar: AppBar(
        title: Text('Habit Tracker'),
        backgroundColor: Colors.blue[700], // Dark blue AppBar
      ),
      body: Column(
        children: [
          // Display habits with checkboxes
          Expanded(
            child: ListView.builder(
              itemCount: habits.length,
              itemBuilder: (context, index) {
                final habit = habits[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Habit Name on the left side
                        Expanded(
                          child: Text(
                            habit.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800], // Dark blue text
                            ),
                          ),
                        ),
                        // Checkboxes on the right side
                        Row(
                          children: [
                            for (int i = 0; i < 7; i++)
                              IconButton(
                                icon: Icon(
                                  habit.weeklyCompletion[i]
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                  color: habit.weeklyCompletion[i]
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                                onPressed: () =>
                                    toggleHabitCompletion(index, i),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Buttons at the bottom of the screen
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final newHabit = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddHabitScreen()),
                    );
                    if (newHabit != null) {
                      setState(() {
                        habits.add(newHabit);
                      });
                    }
                  },
                  child: Text('+',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white)), // "+" for Add Habit
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HabitTrackScreen(habits: habits)),
                    );
                  },
                  child: Text(
                    'View Progress',
                    style: TextStyle(
                        color: Colors.white), // White text color for button
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}