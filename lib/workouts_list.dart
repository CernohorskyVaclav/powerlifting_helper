import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:powerlifting_helper/workout_detail.dart';
import 'package:powerlifting_helper/workout_general.dart';
import 'package:powerlifting_helper/workouts_screen.dart';

import 'database.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class WorkoutsList extends StatefulWidget {
  @override
  _WorkoutsListState createState() => _WorkoutsListState();
}

class _WorkoutsListState extends State<WorkoutsList> {
  void reloadWorkouts() {
    setState(() {});
  }

  List<Data> dataList = [];
  void initState() {
    super.initState();
    final User user = auth.currentUser;
    final uid = user.uid;
    DatabaseReference referenceData =
        FirebaseDatabase.instance.reference().child(uid + '/workouts/');
    referenceData.once().then((DataSnapshot dataSnapshot) {
      dataList.clear();
      var keys = dataSnapshot.value.keys;
      var values = dataSnapshot.value;

      for (var key in keys) {
        Data data = new Data(
          values[key]["exercise"],
          values[key]["sets"],
          values[key]["reps"],
          values[key]["weight"],
          values[key]["comment"],
          values[key]["time"],
        );

        dataList.add(data);

        dataList.sort((a, b) => b.time.compareTo(a.time));
      }

      setState(() {
        //
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return dataList.length == 0
        ? Center(
            child: Text(
            "No workouts here :/",
            style: TextStyle(fontSize: 30),
          ))
        : ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (_, index) {
              return CardUI(
                dataList[index].exercise,
                dataList[index].sets,
                dataList[index].reps,
                dataList[index].weight,
                dataList[index].comment,
                dataList[index].time,
              );
            });
  }

  // ignore: non_constant_identifier_names
  Widget CardUI(String exercise, String sets, String reps, String weight,
      String comment, String time) {
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: Text(exercise),
              subtitle: Text("sets: " +
                  sets +
                  "\t\t\t\t\t\t\tReps: " +
                  reps +
                  "\t\t\t\t\t\t\tWeight: " +
                  weight +
                  "\n\nTime: " +
                  time),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WorkoutDetail()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
