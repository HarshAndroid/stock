import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'tab_selection_screen.dart';

void main() {
  //for setting preferred orientation to portrait
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp])
      .then((value) {
    //launching the application
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //changing theme of application
      theme: ThemeData(primarySwatch: Colors.green),
      home: const TabSelectionScreen(),
    );
  }
}
