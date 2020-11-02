import 'package:flutter/material.dart';
import 'package:powerlifting_helper/workouts_screen.dart';
import 'package:powerlifting_helper/calculators_screen.dart';
import 'package:powerlifting_helper/stats_screen.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Workouts(),
    Calculators(),
    Stats(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange[500],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            title: Text('Workouts'),
            activeIcon: Icon(Icons.check_box),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            title: Text('Calculators'),
            activeIcon: Icon(Icons.desktop_windows),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            title: Text('Stats'),
            activeIcon: Icon(Icons.multiline_chart),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        //backgroundColor: Colors.orange[500],
      ),
    );
  }
}
