import 'package:flutter/material.dart';
import 'package:powerlifting_helper/new_workout_screen.dart';
import 'package:powerlifting_helper/workout_general.dart';

class WorkoutDetail extends StatefulWidget {
  @override
  _WorkoutDetailState createState() => _WorkoutDetailState();
}

class _WorkoutDetailState extends State<WorkoutDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[500],
      ),
      body: Center(),
    );
  }
}
