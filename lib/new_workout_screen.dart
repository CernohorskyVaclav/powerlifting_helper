import 'package:flutter/material.dart';
import 'package:powerlifting_helper/workouts_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

class _NewWorkoutState extends State<NewWorkout> {
  var _setsTextController = new TextEditingController();
  var _repsTextController = new TextEditingController();
  var _weightTextController = new TextEditingController();
  var _commentTextController = new TextEditingController();

  void getItems() {
    setState(() {
      exerciseValue = dropdownStr;
      sets = _setsTextController.text;
      reps = _repsTextController.text;
      weight = _weightTextController.text;
      comment = _commentTextController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('New Workout'),
        backgroundColor: Colors.orange[500],
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
                  horizontal: 100,
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
