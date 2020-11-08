import 'package:flutter/material.dart';
import 'package:powerlifting_helper/calculators_screen.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('One Rep Max Caluclator'),
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
                  controller: firstNumberController,
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
                  vertical: 10,
                  horizontal: 5,
                ),
                child: TextField(
                  controller: secondNumberController,
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
      ),
    );
  }
}
