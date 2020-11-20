import 'package:firebase_database/firebase_database.dart';
import 'package:powerlifting_helper/workouts_screen.dart';
import 'package:flutter/material.dart';

class WorkoutGeneral {
  String specificExercise;
  String setsNum;
  String repsNum;
  String weightNum;
  String comment;
  String time;
  DatabaseReference _id;
  String idKey;

  WorkoutGeneral(
    this.specificExercise,
    this.setsNum,
    this.repsNum,
    this.weightNum,
    this.comment,
    this.time,
    this.idKey,
  );

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson(DatabaseReference id) {
    return {
      'exercise': this.specificExercise,
      'sets': /*int.parse(*/ this.setsNum /*)*/,
      'reps': /*int.parse(*/ this.repsNum /*)*/,
      'weight': /*int.parse(*/ this.weightNum /*)*/,
      'comment': this.comment,
      'time': this.time,
      'workoutId': id.key.toString(),
    };
  }
}
