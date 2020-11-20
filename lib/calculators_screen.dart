import 'package:flutter/material.dart';
import 'package:powerlifting_helper/max_calc_screen.dart';
import 'package:powerlifting_helper/rpe_calc_screen.dart';
import 'package:powerlifting_helper/sign_in.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Calculators extends StatefulWidget {
  @override
  _CalculatorsState createState() => _CalculatorsState();
}

class _CalculatorsState extends State<Calculators> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Calculators'),
        backgroundColor: Colors.orange[500],
        actions: <Widget>[
          FlatButton(
            child: Text(
              "LogOut",
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
      body: Center(
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
                        MaterialPageRoute(
                            builder: (context) => MaxCalculator()),
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
              Container(
                height: 10.0,
                width: 500.0,
                color: Colors.orange[500],
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
                        MaterialPageRoute(
                            builder: (context) => RpeCalculator()),
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
      ),
    );
  }
}
