import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:goeasy/auth/signup.dart';
import 'package:goeasy/auth/verify.dart';
import 'package:goeasy/home.dart';
import 'package:goeasy/auth/signup.dart';
// import 'package:goeasy/home.dart';
import 'package:goeasy/registration/seller.dart';
import 'package:goeasy/seller_interface/seller_home.dart';
// import 'package:goeasy/auth/verify.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo app',
      home: seller_home(),
    );
  }
}
