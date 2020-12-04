import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'workout_general.dart';

final databaseReference = FirebaseDatabase.instance.reference();
final FirebaseAuth auth = FirebaseAuth.instance;

DatabaseReference saveWorkout(WorkoutGeneral workoutGeneral) {
  final User user = auth.currentUser;
  final uid = user.uid;
  String exercise = workoutGeneral.specificExercise;
  String exerciseChoice;
  if (exercise == "Back squat" ||
      exercise == "Front squat" ||
      exercise == "Paused squat") {
    exerciseChoice = "squat";
  } else if (exercise == "Bench press" ||
      exercise == "Touch & go BP" ||
      exercise == "Long paused BP") {
    exerciseChoice = "bench";
  } else if (exercise == "Conventional deadlift" ||
      exercise == "Sumo deadlift" ||
      exercise == "Paused deadlift" ||
      exercise == "Deficit deadlift") {
    exerciseChoice = "deadlift";
  }

  var id = databaseReference.child(uid + '/workouts/' + exerciseChoice).push();
  id.set(workoutGeneral.toJson(id));
  return id;
}

class Data {
  String exercise, sets, reps, weight, comment, time, workoutId, volume;

  Data(this.exercise, this.sets, this.reps, this.weight, this.comment,
      this.time, this.workoutId, this.volume);
}
