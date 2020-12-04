import 'package:flutter/material.dart';
import 'package:powerlifting_helper/sign_in.dart';
import 'package:powerlifting_helper/volumechart_screen.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  String exerciseChoice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange[500],
        title: Text(
          "Stats",
        ),
        actions: <Widget>[
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
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 20,
            ),
            child: ButtonTheme(
              height: 60,
              minWidth: 300,
              child: FlatButton(
                color: Colors.orange[500],
                textColor: Colors.white,
                onPressed: () {
                  exerciseChoice = "squat";
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VolumeChart(exerciseChoice)));
                },
                child: Text(
                  "Squat stats",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 20,
            ),
            child: ButtonTheme(
              height: 60,
              minWidth: 300,
              child: FlatButton(
                color: Colors.orange[500],
                textColor: Colors.white,
                onPressed: () {
                  exerciseChoice = "bench";
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VolumeChart(exerciseChoice)));
                },
                child: Text(
                  "Bench press stats",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 20,
            ),
            child: ButtonTheme(
              height: 60,
              minWidth: 300,
              child: FlatButton(
                color: Colors.orange[500],
                textColor: Colors.white,
                onPressed: () {
                  exerciseChoice = "deadlift";
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VolumeChart(exerciseChoice)));
                },
                child: Text(
                  "Deadlift stats",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
