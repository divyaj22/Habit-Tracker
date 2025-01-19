import 'package:shared_preferences/shared_preferences.dart';

class Habit {
  final String name;
  List<bool> weeklyCompletion; // Make it mutable (no final)

  Habit({
    required this.name,
    required this.weeklyCompletion,
  });

  // Save completion status to SharedPreferences
  Future<void> saveHabitCompletion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      name, // Use the habit name as the key
      weeklyCompletion
          .map((e) => e.toString())
          .toList(), // Save as list of strings
    );
  }

  // Load completion status from SharedPreferences
  Future<List<bool>> loadHabitCompletion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? completionList = prefs.getStringList(name);

    // Return the list of bools (true/false) for each day of the week, defaulting to [false, false, false, false, false, false, false]
    if (completionList != null) {
      return completionList.map((e) => e == 'true').toList();
    } else {
      return [
        false,
        false,
        false,
        false,
        false,
        false,
        false
      ]; // Default value (not completed for any day)
    }
  }
}