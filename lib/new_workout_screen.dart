import 'package:flutter/material.dart';
import 'package:powerlifting_helper/workouts_screen.dart';
import 'package:powerlifting_helper/workout_general.dart';

import 'nav.dart';

class NewWorkout extends StatefulWidget {
  @override
  _NewWorkoutState createState() => _NewWorkoutState();
}

String dropdownStr = "Bench press";
String exerciseValue = "";
String sets = "";
String reps = "";
String weight = "";
String comment = "";
String time = DateTime.now().toString();

class _NewWorkoutState extends State<NewWorkout> {
  var _setsTextController = new TextEditingController();
  var _repsTextController = new TextEditingController();
  var _weightTextController = new TextEditingController();
  var _commentTextController = new TextEditingController();

  void getItems() {
    var workout =
        new WorkoutGeneral(exerciseValue, sets, reps, weight, comment, time);
    setState(() {
      exerciseValue = dropdownStr;
      sets = _setsTextController.text;
      reps = _repsTextController.text;
      weight = _weightTextController.text;
      comment = _commentTextController.text;
      time = DateTime.now().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('New Workout'),
        backgroundColor: Colors.orange[500],
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Go back to workouts",
              style: TextStyle(fontSize: 18),
            ),
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Nav()));
            },
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Center(
        child: ButtonTheme(
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  "Select an exercise",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                ),
                child: DropdownButton<String>(
                  value: dropdownStr,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownStr = newValue;
                    });
                  },
                  items: <String>[
                    "Bench press",
                    "Back squat",
                    "Conventional deadlift",
                    "Sumo deadlift",
                    "Touch & go BP",
                    "Long paused BP",
                    "Front squat",
                    "Paused squat",
                    "Paused deadlift",
                    "Deficit deadlift",
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              TextField(
                controller: _setsTextController,
                cursorColor: Colors.black,

                //obscureText: true,
                decoration: InputDecoration(
                    labelStyle: new TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[500]),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[500]),
                    ),
                    labelText: 'Insert sets here'),
              ),
              TextField(
                controller: _repsTextController,
                cursorColor: Colors.black,
                //obscureText: true,
                decoration: InputDecoration(
                    labelStyle: new TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[500]),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[500]),
                    ),
                    labelText: 'Insert reps here'),
              ),
              TextField(
                controller: _weightTextController,
                cursorColor: Colors.black,
                //obscureText: true,
                decoration: InputDecoration(
                    labelStyle: new TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[500]),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[500]),
                    ),
                    labelText: 'Insert weight here'),
              ),
              TextFormField(
                minLines: 2,
                maxLines: 7,
                controller: _commentTextController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    labelStyle: new TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[500]),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[500]),
                    ),
                    labelText: 'Insert comments here'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 90,
                  vertical: 30,
                ),
                child: FlatButton(
                  color: Colors.orange[500],
                  textColor: Colors.white,
                  onPressed: () {
                    getItems();
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => new Workouts(
                            exerciseValue: exerciseValue,
                            sets: sets,
                            reps: reps,
                            weight: weight,
                            comment: comment,
                            time: time,
                          ),
                        ));
                  },
                  child: Text(
                    "Add exercise",
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
