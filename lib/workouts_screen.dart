import 'package:flutter/material.dart';
import 'package:powerlifting_helper/new_workout_screen.dart';

class Workouts extends StatelessWidget {
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
                      MaterialPageRoute(builder: (context) => NewWorkout()),
                    );
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
            ],
          ),
        ),
      ),
    );
  }
}
