import 'package:example_for_examing/models/homePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/image2.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 36.0, vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Choose a course and get results.",
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                          fontSize: 32.0,
                          color: Color(0xFF0F1826),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "We have structured the lessons for you. Find your theme or trainer and start",
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF0F1826),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    },
                    child: Container(
                      padding: EdgeInsets.all(42.0),
                      decoration: BoxDecoration(
                          color: Colors.indigo.shade400,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(-4.0, 12.0),
                                color: Colors.indigo.shade400.withOpacity(0.4)),
                          ]),
                      child: Text(
                        "Start",
                        style: GoogleFonts.comfortaa(
                          textStyle: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
