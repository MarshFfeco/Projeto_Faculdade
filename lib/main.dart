import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'package:fadba/Controller/User1.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Screens/AdmScreen/AdmScreen.dart';
import 'Screens/FirstScreen/FirstScreen.dart';
import 'Screens/MainPage/MainPage.dart';
import 'Screens/SignUp/SignUpScreen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      title: "F A D B A",
      home: FirstScreen(),
      /*MainPage(
        usuario: Admin(),
      ),*/
    ),
  );
}
