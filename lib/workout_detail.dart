import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:powerlifting_helper/database.dart';
import 'package:powerlifting_helper/pics_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class WorkoutDetail extends StatefulWidget {
  final String choiceOfExercise;
  final String workoutId;
  WorkoutDetail(this.workoutId, this.choiceOfExercise);
  @override
  _WorkoutDetailState createState() => _WorkoutDetailState();
}

class _WorkoutDetailState extends State<WorkoutDetail> {
  String exercise;
  String sets;
  String reps;
  String weight;
  String comment;
  String time;
  List<Data> dataList;
  String commentDetail = "";
  String editedComment = "";
  String workoutId;

  void initState() {
    super.initState();
    final User user = auth.currentUser;
    final uid = user.uid;
    DatabaseReference referenceData = FirebaseDatabase.instance
        .reference()
        .child(uid +
            '/workouts/' +
            widget.choiceOfExercise +
            "/" +
            widget.workoutId);
    referenceData.once().then((DataSnapshot dataSnapshot) {
      var values = dataSnapshot.value;
      exercise = values["exercise"].toString();
      sets = values["sets"].toString();
      reps = values["reps"].toString();
      weight = values["weight"].toString();
      comment = values["comment"].toString();
      time = values["time"].toString();
      workoutId = values["workoutId"].toString();
      editComment();
      setState(() {});
    });
  }

  void editComment() {
    if (comment.length >= 8) {
      editedComment = comment.substring(0, 8) + "...";
      commentDetail = "full comment";
    } else {
      editedComment = comment;
    }
  }

  @override
  Widget build(BuildContext context) {
    return exercise == null ||
            sets == null ||
            reps == null ||
            weight == null ||
            comment == null ||
            time == null
        ? Center(
            child: Text(
            "Loading...",
            style: TextStyle(fontSize: 30, color: Colors.black),
          ))
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange[500],
              title: Text(exercise + " workout"),
            ),
            body: Column(
              children: [
                Container(
                  color: Colors.orange[400],
                  constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height * 0.350,
                      width: MediaQuery.of(context).size.width),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Sets",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.orange[50]),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    sets,
                                    style: TextStyle(
                                        fontSize: 28, color: Colors.white),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Reps",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.orange[50]),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    reps,
                                    style: TextStyle(
                                        fontSize: 28, color: Colors.white),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Weight",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.orange[50]),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    weight,
                                    style: TextStyle(
                                        fontSize: 28, color: Colors.white),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Comment",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.orange[50]),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    editedComment,
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.white),
                                  ),
                                  SizedBox(height: 6),
                                  GestureDetector(
                                    onTap: () {
                                      return Alert(
                                              context: context,
                                              title: "Comment",
                                              desc: comment)
                                          .show();
                                    },
                                    child: Text(
                                      commentDetail,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.lightBlue),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 150,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Date and time",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.orange[50]),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      time.substring(0, 4) +
                                          "." +
                                          time.substring(5, 7) +
                                          "." +
                                          time.substring(8, 10),
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                    Text(
                                      time.substring(11, 16),
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Pics(widget.choiceOfExercise, workoutId),
              ],
            ),
          );
  }
}
