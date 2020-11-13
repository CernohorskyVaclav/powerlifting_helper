import 'package:flutter/material.dart';

class NewWorkout extends StatefulWidget {
  @override
  _NewWorkoutState createState() => _NewWorkoutState();
}

String dropdownStr = "Bench press";

class _NewWorkoutState extends State<NewWorkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Workout+'),
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
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 0,
                ),
                child: TextField(
                  //controller: firstNumberController,
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 0,
                ),
                child: TextField(
                  //controller: firstNumberController,
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 0,
                ),
                child: TextField(
                  //controller: firstNumberController,
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 100,
                ),
                child: FlatButton(
                  color: Colors.orange[500],
                  textColor: Colors.white,
                  onPressed: () {},
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

class StatefulWidgetWidget {}
