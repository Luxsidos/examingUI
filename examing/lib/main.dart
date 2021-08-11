import 'package:example_for_examing/models/homePage.dart';
import 'package:example_for_examing/models/loginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examing',
      theme: ThemeData(
        textTheme: GoogleFonts.comfortaaTextTheme(TextTheme(
          bodyText1: TextStyle(color: Color(0xFF0F1826)),
          bodyText2: TextStyle(color: Color(0xFF0F1826)),
        )),
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text("ERROR"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return LoginPage();
        }
        return Scaffold(
          appBar: AppBar(
            title: Text("LOADING..."),
          ),
        );
      },
    );
  }
}
