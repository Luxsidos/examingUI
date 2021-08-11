import 'dart:math';
import 'package:example_for_examing/models/databaseForImages.dart';
import 'package:example_for_examing/models/loginDatas.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class MenuPage extends StatefulWidget {
  MenuPage({Key? key}) : super(key: key);

  static List<LoginDatas>? downloads;

  @override
  _MenuPageState createState() => _MenuPageState();
}

FirebaseAuth _authUser = FirebaseAuth.instance;

class _MenuPageState extends State<MenuPage> {
  DatabaseHelper? dbh;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbh = DatabaseHelper();
  }

  var imgNetwork = [
    "https://mir-s3-cdn-cf.behance.net/projects/original/4d700854734421.Y3JvcCw1OTQsNDY1LDAsMjI3.jpg",
    "https://mir-s3-cdn-cf.behance.net/project_modules/1400_opt_1/c976fb79681909.5ccad1df2b7c2.png",
    "https://i.pinimg.com/originals/2b/f3/1d/2bf31d85495c04175edaeb3be3f45039.jpg",
    "https://i.pinimg.com/originals/ac/4c/46/ac4c46c1f362a60343957c26269d40db.png",
    "https://i.pinimg.com/736x/10/b2/3f/10b23f500f963df4f2d057f487a48daf.jpg",
    "https://mir-s3-cdn-cf.behance.net/projects/original/4f739941921035.Y3JvcCwxNzY3LDEzODMsODgxLDUyMw.png",
    "https://image.freepik.com/free-vector/flat-simple-geometric-elements_52683-56061.jpg",
    "https://image.freepik.com/free-vector/hand-drawn-minimal-background_52683-65045.jpg",
    "https://image.freepik.com/free-vector/flat-colorful-geometric-background_52683-61877.jpg",
    "https://image.freepik.com/free-vector/abstract-geometric-shapes-background_52683-62917.jpg",
  ];

  void _getPictures() async {
    for (String item in imgNetwork) {
      var image = await http.get(Uri.parse(item));

      var bytes = image.bodyBytes;
      LoginDatas picture = LoginDatas(bytes);

      dbh!.insertPicture(picture);
    }
  }

  List<Color> color1 = [
    Colors.yellow.shade600,
    Colors.indigo.shade600,
    Colors.redAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 86.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                backgroundColor: color1[Random().nextInt(3)],
                child: Icon(
                  CupertinoIcons.person_fill,
                  color: Colors.white54,
                ),
              ),
            ),
            Text(
              "Hello!",
              style: GoogleFonts.comfortaa(
                textStyle: TextStyle(
                  color: Color(0xFF0F1826),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.notifications,
                color: Color(0xFF0F1826),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<LoginDatas>>(
        future: dbh!.queryPicture(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            MenuPage.downloads = snapshot.data;
            print("TRUUUUEEEE");
            if (MenuPage.downloads!.length != 0) {
              print("TOG'RI KELDI");
              return Container(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
                      child: Column(
                        children: [
                          Text(
                            "Find your favorite course here",
                            style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(
                                  fontSize: 28.0,
                                  color: Color(0xFF0F1826),
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 24.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    style: GoogleFonts.comfortaa(),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          borderSide: BorderSide.none),
                                      fillColor:
                                          Color(0xFF0F1826).withOpacity(0.03),
                                      filled: true,
                                      hintText: "Search",
                                      hintStyle: GoogleFonts.comfortaa(),
                                      prefixIcon: Icon(
                                        CupertinoIcons.search,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Container(
                                  width: 56.0,
                                  height: 56.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: Color(0xFF0F1826),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      CupertinoIcons.settings,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          leftTitle("Popular", "Courses"),
                          SizedBox(height: 16.0),
                        ],
                      ),
                    ),
                    Container(
                      height: 172.0,
                      child: ListView.builder(
                        itemCount: 4,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                right: 16.0, left: index == 0 ? 32.0 : 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 176.0,
                                    decoration: BoxDecoration(
                                        color: color1[Random().nextInt(3)],
                                        image: DecorationImage(
                                          image: MemoryImage(MenuPage
                                              .downloads![index + 5].picture!),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Acuostic Guitar",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                Text(
                                  "10 courses",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: List.generate(5, (index) {
                          return index == 0
                              ? Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: leftTitle("Profissional", "Trainers"),
                                )
                              : Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 12.0),
                                  decoration: BoxDecoration(
                                      color:
                                          Color(0xFF0F1826).withOpacity(0.03),
                                      borderRadius:
                                          BorderRadius.circular(16.0)),
                                  child: ListTile(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return SimpleDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              title: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 16.0),
                                                    child: CircleAvatar(
                                                      backgroundColor: color1[
                                                          Random().nextInt(3)],
                                                      child: Icon(
                                                        CupertinoIcons
                                                            .person_fill,
                                                        color: Colors.white54,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "Martin Kenter",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF0F1826)),
                                                  ),
                                                ],
                                              ),
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.all(16.0),
                                                  height: 230.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    color: color1[
                                                        Random().nextInt(3)],
                                                    image: DecorationImage(
                                                      image: MemoryImage(
                                                          MenuPage
                                                              .downloads![index]
                                                              .picture!),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    contentPadding: EdgeInsets.all(8.0),
                                    leading: CircleAvatar(
                                      backgroundColor:
                                          color1[Random().nextInt(3)],
                                      backgroundImage: MemoryImage(
                                          MenuPage.downloads![index].picture!),
                                    ),
                                    title: Text(
                                      "Martin Kenter",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xFF0F1826),
                                      ),
                                    ),
                                    subtitle: Text(
                                      "10 courses",
                                      style: TextStyle(
                                        color: Color(0xFF0F1826),
                                      ),
                                    ),
                                    trailing: Icon(
                                      CupertinoIcons.forward,
                                      color: Color(0xFF0F1826),
                                    ),
                                  ),
                                );
                        }),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              print("KICHIK ELSE");
              _getPictures();
              return Container(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
                      child: Column(
                        children: [
                          Text(
                            "Find your favorite course here",
                            style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(
                                  fontSize: 28.0,
                                  color: Color(0xFF0F1826),
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 24.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    style: GoogleFonts.comfortaa(),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          borderSide: BorderSide.none),
                                      fillColor:
                                          Color(0xFF0F1826).withOpacity(0.03),
                                      filled: true,
                                      hintText: "Search",
                                      hintStyle: GoogleFonts.comfortaa(),
                                      prefixIcon: Icon(
                                        CupertinoIcons.search,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Container(
                                  width: 56.0,
                                  height: 56.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: Color(0xFF0F1826),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      CupertinoIcons.settings,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          leftTitle("Popular", "Courses"),
                          SizedBox(height: 16.0),
                        ],
                      ),
                    ),
                    Container(
                      height: 172.0,
                      child: ListView.builder(
                        itemCount: 5,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                right: 16.0, left: index == 0 ? 32.0 : 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 176.0,
                                    decoration: BoxDecoration(
                                        color: color1[Random().nextInt(3)],
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Acuostic Guitar",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                Text(
                                  "10 courses",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: List.generate(5, (index) {
                          return index == 0
                              ? Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: leftTitle("Profissional", "Trainers"),
                                )
                              : Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 12.0),
                                  decoration: BoxDecoration(
                                      color:
                                          Color(0xFF0F1826).withOpacity(0.03),
                                      borderRadius:
                                          BorderRadius.circular(16.0)),
                                  child: ListTile(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return SimpleDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              title: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 16.0),
                                                    child: CircleAvatar(
                                                      backgroundColor: color1[
                                                          Random().nextInt(3)],
                                                      child: Icon(
                                                        CupertinoIcons
                                                            .person_fill,
                                                        color: Colors.white54,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "Martin Kenter",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF0F1826)),
                                                  ),
                                                ],
                                              ),
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.all(16.0),
                                                  height: 230.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    color: color1[
                                                        Random().nextInt(3)],
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          "https://i.pinimg.com/736x/10/b2/3f/10b23f500f963df4f2d057f487a48daf.jpg"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    contentPadding: EdgeInsets.all(8.0),
                                    leading: CircleAvatar(
                                      backgroundColor:
                                          color1[Random().nextInt(3)],
                                      child: Icon(
                                        CupertinoIcons.person_fill,
                                        color: Colors.white54,
                                      ),
                                    ),
                                    title: Text(
                                      "Martin Kenter",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xFF0F1826),
                                      ),
                                    ),
                                    subtitle: Text(
                                      "10 courses",
                                      style: TextStyle(
                                        color: Color(0xFF0F1826),
                                      ),
                                    ),
                                    trailing: Icon(
                                      CupertinoIcons.forward,
                                      color: Color(0xFF0F1826),
                                    ),
                                  ),
                                );
                        }),
                      ),
                    ),
                  ],
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  leftTitle(String char1, String char2) {
    return Row(
      children: [
        Text(
          "$char1",
          style: GoogleFonts.comfortaa(
            textStyle: TextStyle(
              color: Color(0xFF0F1826),
              fontWeight: FontWeight.w900,
              fontSize: 24.0,
            ),
          ),
        ),
        SizedBox(width: 6.0),
        Text(
          "$char2",
          style: GoogleFonts.comfortaa(
            textStyle: TextStyle(
              color: Color(0xFF0F1826),
              fontSize: 24.0,
            ),
          ),
        ),
      ],
    );
  }
}
