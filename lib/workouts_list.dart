import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:powerlifting_helper/workout_detail.dart';
import 'package:powerlifting_helper/workout_general.dart';
import 'package:powerlifting_helper/workouts_screen.dart';

import 'database.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class WorkoutsList extends StatefulWidget {
  final List<WorkoutGeneral> listItems;
  final User user;
  WorkoutsList(this.listItems, this.user);

  @override
  _WorkoutsListState createState() => _WorkoutsListState();
}

class _WorkoutsListState extends State<WorkoutsList> {
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
        );
        dataList.add(data);
      }
      setState(() {
        //
      });
    });
  }

  void resetPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return dataList.length == 0
        ? Center(
            child: Text(
            "No Data Available",
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
                  dataList[index].comment);
            });
  }

  Widget CardUI(String exercise, String sets, String reps, String weight,
      String comment) {
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
                  weight),
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
