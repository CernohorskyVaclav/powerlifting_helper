import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:powerlifting_helper/database.dart';
import 'package:powerlifting_helper/new_workout_screen.dart';
import 'package:powerlifting_helper/sign_in.dart';
import 'package:powerlifting_helper/workout_general.dart';
import 'package:powerlifting_helper/workouts_list.dart';

import 'nav.dart';

// ignore: must_be_immutable
class Workouts extends StatefulWidget {
  Workouts(
      {Key key,
      @required this.exerciseValue,
      this.sets,
      this.reps,
      this.weight,
      this.comment,
      this.user,
      this.time});
  final String exerciseValue;
  final String sets;
  final String reps;
  final String weight;
  final String comment;
  final User user;
  final String time;

  @override
  _WorkoutsState createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  List<WorkoutGeneral> workoutGeneral = [];

  void newWorkout() {
    var workout =
        new WorkoutGeneral(exerciseValue, sets, reps, weight, comment, time);
    workout.setId(saveWorkout(workout));
    this.setState(() {
      workoutGeneral.add(workout);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Workouts'),
        backgroundColor: Colors.orange[500],
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Load workouts",
              style: TextStyle(fontSize: 18),
            ),
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Nav()));
            },
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
          FlatButton(
            child: Text(
              "LogOut",
              style: TextStyle(fontSize: 18),
            ),
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
            },
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Center(
        child: ButtonTheme(
          height: 70,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
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
              Container(
                constraints: BoxConstraints.expand(
                    height: MediaQuery.of(context).size.height * 0.55),
                child: WorkoutsList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
