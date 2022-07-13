import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/markets_screen.dart';

//custom color
const myColor = Color(0xFF0b384f);
//for storing current device's screen size
late Size mq;

class TabSelectionScreen extends StatefulWidget {
  const TabSelectionScreen({Key? key}) : super(key: key);

  @override
  State<TabSelectionScreen> createState() => _TabSelectionScreenState();
}

class _TabSelectionScreenState extends State<TabSelectionScreen> {
  int _index = 0;
  final _tabs = const [
    //user home screen (default screen)
    HomeScreen(),
    //dummy status page
    Scaffold(body: Center(child: Icon(Icons.pie_chart_rounded, size: 50))),
    //dummy exchange page
    Scaffold(
        body: Center(
            child: Icon(CupertinoIcons.arrow_right_arrow_left_circle_fill,
                size: 50))),
    //market's screen
    MarketsScreen(),
    //dummy profile page
    Scaffold(body: Center(child: Icon(CupertinoIcons.person, size: 50)))
  ];

  @override
  Widget build(BuildContext context) {
    //getting screen width & height using media query
    mq = MediaQuery.of(context).size;

    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
          //bottom tab bar
          tabBar: CupertinoTabBar(
            onTap: (i) {
              setState(() => _index = i);
            },
            currentIndex: _index,
            activeColor: myColor,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart_rounded, size: 25),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.arrow_right_arrow_left_circle_fill,
                  color: Colors.greenAccent.shade700,
                  size: 45,
                ),
              ),
              const BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/levels.png'),
                  size: 23,
                ),
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.person,
                  size: 25,
                ),
              )
            ],
          ),
          //when a tab bar item is clicked, switch to that particular screen
          tabBuilder: (BuildContext context, index) {
            return _tabs[index];
          }),
    );
  }
}
