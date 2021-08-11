import 'package:example_for_examing/models/allPages/menuPage.dart';
import 'package:example_for_examing/models/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OverView extends StatelessWidget {
  const OverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F1826),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 86.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
        title: Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Text(
            "Overview",
            style: GoogleFonts.comfortaa(
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "You will get Acoustic Guiter lesson",
                  style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: Container(
                  child: PageView.builder(
                      itemCount: 4,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: Colors.white,
                                    ),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 24.0),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: MenuPage.downloads!.isEmpty
                                              ? Image.network(
                                                  "https://mir-s3-cdn-cf.behance.net/projects/original/4f739941921035.Y3JvcCwxNzY3LDEzODMsODgxLDUyMw.png",
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.memory(MenuPage
                                                  .downloads![2].picture!),
                                        ),
                                        Text(
                                          "Stumming Pattern",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(
                                          "Keep your strumming hand moving at all times",
                                          style: TextStyle(fontSize: 12.0),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(height: 32.0),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 28.0),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: TextButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 18.0),
                                  child: Text(
                                    "Trial lesson",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.indigo.shade400,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
