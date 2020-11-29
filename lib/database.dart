import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'workout_general.dart';

final databaseReference = FirebaseDatabase.instance.reference();
final FirebaseAuth auth = FirebaseAuth.instance;

DatabaseReference saveWorkout(WorkoutGeneral workoutGeneral) {
  final User user = auth.currentUser;
  final uid = user.uid;
  String exercise = workoutGeneral.specificExercise;

  var id = databaseReference.child(uid + '/workouts/').push();
  id.set(workoutGeneral.toJson(id));
  return id;
}

class Data {
  String exercise, sets, reps, weight, comment, time, workoutId;

  Data(this.exercise, this.sets, this.reps, this.weight, this.comment,
      this.time, this.workoutId);
}
