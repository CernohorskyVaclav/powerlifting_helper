import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RpeCalculator extends StatefulWidget {
  @override
  _RpeCalculatorState createState() => _RpeCalculatorState();
}

class _RpeCalculatorState extends State<RpeCalculator> {
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
      answer = rpeSpreadScheet[rpe][reps];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RPE to % Caluclator'),
        backgroundColor: Colors.orange[500],
      ),
      body: Center(
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 5,
                ),
                child: TextField(
                  controller: thirdNumberController,
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
                      labelText: 'Insert reps here (1 - 10)'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 5,
                ),
                child: TextField(
                  controller: fourthNumberController,
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
                      labelText: 'Insert RPE here (6.5 - 10)'),
                ),
              ),
              FlatButton(
                color: Colors.orange[500],
                textColor: Colors.white,
                onPressed: () {
                  calculateRPEToPercentage();
                  return Alert(
                          context: context,
                          title: thirdNumberController.text +
                              " " +
                              repsString +
                              " at " +
                              fourthNumberController.text +
                              " rpe is:",
                          desc: answer.toString() + "%")
                      .show();
                },
                child: Text(
                  "Calculate",
                ),
              ),
            ]),
      ),
    );
  }
}
