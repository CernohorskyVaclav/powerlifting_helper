import 'package:charts_flutter/flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'database.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:rflutter_alert/rflutter_alert.dart';

class VolumeChart extends StatefulWidget {
  final String exerciseChoice;
  VolumeChart(this.exerciseChoice);
  @override
  _VolumeChartState createState() => _VolumeChartState();
}

class _VolumeChartState extends State<VolumeChart> {
  List<Data> dataList = [];
  List<VolumeSeriesTime> seriesData = [];
  var series;

  void initState() {
    super.initState();
    final User user = auth.currentUser;
    final uid = user.uid;
    DatabaseReference referenceData = FirebaseDatabase.instance
        .reference()
        .child(uid + '/workouts/' + widget.exerciseChoice);
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
          values[key]["workoutId"],
          values[key]["volume"],
        );

        dataList.add(data);

        dataList.sort((a, b) => a.time.compareTo(b.time));
      }

      /*{if (dataList.length != 0) {
        for (int i = 0; i < dataList.length; i++) {
          seriesData.add(VolumeSeriesTime(double.parse(dataList[i].volume),
              DateTime.parse(dataList[i].time)));
        }
      }
      series = [
        new charts.Series<VolumeSeriesTime, DateTime>(
          id: 'Volume',
          colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
          domainFn: (VolumeSeriesTime vst, _) => vst.time,
          measureFn: (VolumeSeriesTime vst, _) => vst.volume,
          data: seriesData,
        ),
      ];*/

      setState(() {
        //
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[500],
        title: Text(
          widget.exerciseChoice.substring(0, 1).toUpperCase() +
              widget.exerciseChoice.substring(1, widget.exerciseChoice.length) +
              " volume chart",
        ),
      ),
      body: chartWidget(),
    );
  }

  Widget chartWidget() {
    if (dataList.length != 0) {
      for (int i = 0; i < dataList.length; i++) {
        seriesData.add(VolumeSeriesTime(dataList[i].volume, dataList[i].time));
      }
    }
    series = [
      new charts.Series<VolumeSeriesTime, String>(
        id: 'Volume',
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault.darker,
        domainFn: (VolumeSeriesTime vst, _) => vst.time,
        measureFn: (VolumeSeriesTime vst, _) => int.parse(vst.volume),
        data: seriesData,
      ),
    ];
    var chart = new charts.BarChart(
      series,
      animate: true,
      domainAxis: new charts.OrdinalAxisSpec(
          showAxisLine: true, renderSpec: new charts.NoneRenderSpec()),
      behaviors: [
        new charts.ChartTitle('Volume',
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
        new charts.ChartTitle('Time (ascending)',
            behaviorPosition: charts.BehaviorPosition.bottom,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
        new charts.ChartTitle('To get specific time click on a bar',
            behaviorPosition: charts.BehaviorPosition.top,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
      ],
      selectionModels: [
        SelectionModelConfig(changedListener: (SelectionModel model) {
          if (model.hasDatumSelection)
            return Alert(
                    context: context,
                    title: "Date and time",
                    desc: model.selectedSeries[0]
                        .domainFn(model.selectedDatum[0].index)
                        .toString()
                        .substring(0, 19))
                .show();
        })
      ],
    );
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.all(5.0),
            child: new SizedBox(
              height: MediaQuery.of(context).size.height * 0.77,
              child: chart,
            ),
          ),
        ],
      ),
    );
  }
}

class VolumeSeriesTime {
  final String volume;
  final String time;
  VolumeSeriesTime(this.volume, this.time);
}
