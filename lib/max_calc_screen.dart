import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MaxCalculator extends StatefulWidget {
  @override
  _MaxCalculatorState createState() => _MaxCalculatorState();
}

class _MaxCalculatorState extends State<MaxCalculator> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //1RM calc
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 0.0,
                  ),
                  child: Text(
                    'One Rep Max Calculator',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[500],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: TextField(
                controller: firstNumberController,
                cursorColor: Colors.orange[500],
                //obscureText: true,
                decoration: InputDecoration(
                    labelStyle: new TextStyle(
                      color: Colors.orange[500],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[500]),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[500]),
                    ),
                    labelText: 'Insert weight here'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: TextField(
                controller: secondNumberController,
                cursorColor: Colors.orange[500],
                //obscureText: true,
                decoration: InputDecoration(
                    labelStyle: new TextStyle(
                      color: Colors.orange[500],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[500]),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[500]),
                    ),
                    labelText: 'Insert number of reps here'),
              ),
            ),
            FlatButton(
              color: Colors.orange[500],
              textColor: Colors.white,
              onPressed: () {
                calculateOneRM();
                return Alert(
                        context: context,
                        title: "Your 1RM is:",
                        desc: answerOneMax.toString())
                    .show();
              },
              child: Text(
                "Calculate",
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
            //RPE to % calc
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 0.0,
                  ),
                  child: Text(
                    'RPE to % Calculator',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[500],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: TextField(
                controller: thirdNumberController,
                cursorColor: Colors.orange[500],
                //obscureText: true,
                decoration: InputDecoration(
                    labelStyle: new TextStyle(
                      color: Colors.orange[500],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[500]),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[500]),
                    ),
                    labelText: 'Insert reps here (1 - 10)'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: TextField(
                controller: fourthNumberController,
                cursorColor: Colors.orange[500],
                //obscureText: true,
                decoration: InputDecoration(
                    labelStyle: new TextStyle(
                      color: Colors.orange[500],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[500]),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[500]),
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
    );
  }
}
