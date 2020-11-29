import 'package:flutter/material.dart';
import 'package:powerlifting_helper/nav.dart';
import 'package:powerlifting_helper/sign_in.dart';
import 'package:powerlifting_helper/workouts_list.dart';

class SpecificWorkouts extends StatefulWidget {
  final String exerciseChoice;
  SpecificWorkouts(this.exerciseChoice);
  @override
  _SpecificWorkoutsState createState() => _SpecificWorkoutsState();
}

class _SpecificWorkoutsState extends State<SpecificWorkouts> {
  String choiceOfExercise;
  void initState() {
    super.initState();
    choiceOfExercise = widget.exerciseChoice;
    setState(() {
      //
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange[500],
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Go back",
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
              "Reload workouts",
              style: TextStyle(fontSize: 18),
            ),
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SpecificWorkouts(choiceOfExercise)));
            },
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
          FlatButton(
            child: Text(
              "Logout",
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
                  "Workout history",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints.expand(
                    height: MediaQuery.of(context).size.height * 0.77),
                child: WorkoutsList(choiceOfExercise),
              )
            ],
          ),
        ),
      ),
    );
  }
}
