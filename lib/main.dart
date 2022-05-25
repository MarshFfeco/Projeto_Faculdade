import 'package:fadba/Controller/User.dart';
import 'package:flutter/material.dart';

import 'Screens/AdmScreen/AdmScreen.dart';
import 'Screens/FirstScreen/FirstScreen.dart';
import 'Screens/MainPage/MainPage.dart';

main() {
  runApp(
    MaterialApp(
      title: "F A D B A",
      home: MainPage(
        usuario: Admin(),
      ),
    ),
  );
}
