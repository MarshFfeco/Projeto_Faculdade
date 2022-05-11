import 'package:fadba/Screens/SignUp/PhotoScreen.dart';
import 'package:fadba/Screens/SignUp/SignUpScreen.dart';
import 'package:flutter/material.dart';

import 'Screens/FirstScreen/FirstScreen.dart';
import 'Screens/MainPage/MainPage.dart';

main() {
  runApp(
    const MaterialApp(
      title: "F A D B A",
      home: Scaffold(
        body: MainPage(),
      ),
    ),
  );
}
