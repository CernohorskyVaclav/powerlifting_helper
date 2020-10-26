import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orange[500],
                    border: Border.all(
                      width: 3.0,
                      color: Colors.orange[600],
                    )),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 5.0,
                  ),
                  child: Text(
                    'One Rep Max Calculator',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
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
          ]),
    );
  }
}
