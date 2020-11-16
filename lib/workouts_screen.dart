import 'package:flutter/material.dart';
import 'package:powerlifting_helper/new_workout_screen.dart';
import 'package:powerlifting_helper/workout_general.dart';

// ignore: must_be_immutable
class Workouts extends StatefulWidget {
  Workouts(
      {Key key,
      @required this.exerciseValue,
      this.sets,
      this.reps,
      this.weight});
  final String exerciseValue;
  final String sets;
  final String reps;
  final String weight;

  @override
  _WorkoutsState createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  List<WorkoutGeneral> workoutGeneral = [];

  void newWorkout() {
    this.setState(() {
      workoutGeneral.add(new WorkoutGeneral(exerciseValue, sets, reps, weight));
    });
    print("it worked!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workouts'),
        backgroundColor: Colors.orange[500],
      ),
      body: Center(
        child: ButtonTheme(
          height: 70,
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  "Quickstart",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: FlatButton(
                  color: Colors.orange[500],
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewWorkout()))
                        .then((value) => this.newWorkout())
                        .then((value) => setState(() {}));
                  },
                  child: Text(
                    "Start a new workout",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  "History",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 200, maxHeight: 370),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("exercise: " + exerciseValue),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("sets: " + sets),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("reps: " + reps),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("weight: " + weight),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
