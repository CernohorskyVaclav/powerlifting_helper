import 'package:flutter/material.dart';
import 'package:powerlifting_helper/max_calc_screen.dart';
import 'package:powerlifting_helper/rpe_calc_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Calculators extends StatefulWidget {
  @override
  _CalculatorsState createState() => _CalculatorsState();
}

class _CalculatorsState extends State<Calculators> {
  TextEditingController firstNumberController = new TextEditingController();
  TextEditingController secondNumberController = new TextEditingController();

  double weightOneMax;
  double repsOneMax;
  double divisorOneMax;
  double answerOneMax;

  TextEditingController thirdNumberController = new TextEditingController();
  TextEditingController fourthNumberController = new TextEditingController();

  final rpeSpreadScheet = [
    [100, 96, 92, 89, 86, 84, 81, 79, 76, 74],
    [98, 94, 91, 88, 85, 82, 80, 77, 75, 72],
    [96, 92, 89, 86, 84, 81, 79, 76, 74, 71],
    [94, 91, 88, 85, 82, 80, 77, 75, 72, 69],
    [92, 89, 86, 84, 81, 79, 76, 74, 71, 68],
    [91, 88, 85, 82, 80, 77, 75, 72, 69, 67],
    [89, 86, 84, 81, 79, 76, 74, 71, 68, 65],
    [88, 85, 82, 80, 77, 75, 72, 69, 67, 64],
  ];

  int reps;
  int rpe;
  int answer;
  String repsString;

  void calculateOneRM() {
    weightOneMax = double.parse(firstNumberController.text);
    repsOneMax = double.parse(secondNumberController.text);
    divisorOneMax = (1.0278 - (0.0278 * repsOneMax));
    if (divisorOneMax != 0) {
      answerOneMax = weightOneMax / divisorOneMax;
    } else {
      print("error, cannot divide by 0");
    }
  }

  void calculateRPEToPercentage() {
    if (thirdNumberController.text == "1") {
      repsString = "rep";
    } else {
      repsString = "reps";
    }
    if (int.parse(thirdNumberController.text) < 1 ||
        int.parse(thirdNumberController.text) > 10) {
      print("Invalid choice of reps");
    } else {
      switch (fourthNumberController.text) {
        case "10":
          {
            rpe = 0;
          }
          break;
        case "9.5":
          {
            rpe = 1;
          }
          break;
        case "9":
          {
            rpe = 2;
          }
          break;
        case "8.5":
          {
            rpe = 3;
          }
          break;
        case "8":
          {
            rpe = 4;
          }
          break;
        case "7.5":
          {
            rpe = 5;
          }
          break;
        case "7":
          {
            rpe = 6;
          }
          break;
        case "6.5":
          {
            rpe = 7;
          }
          break;
        default:
          {
            print("Invalid choice of rpe");
          }
          break;
      }
      reps = int.parse(thirdNumberController.text) - 1;
      print(rpeSpreadScheet[rpe][reps]);
      answer = rpeSpreadScheet[rpe][reps];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ButtonTheme(
              height: 100.0,
              minWidth: 500.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: FlatButton(
                  color: Colors.orange[500],
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MaxCalculator()),
                    );
                  },
                  child: Text(
                    "One Rep Max Caluclator",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),

            //thicc line
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                height: 10.0,
                width: 500.0,
                color: Colors.orange[500],
              ),
            ),
            ButtonTheme(
              height: 100.0,
              minWidth: 500.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: FlatButton(
                  color: Colors.orange[500],
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RpeCalculator()),
                    );
                  },
                  child: Text(
                    "RPE to % Caluclator",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
