import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _onOff = false;
  bool _onOff2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 70.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.comfortaa(
            textStyle: TextStyle(
              color: Color(0xFF0F1826),
              fontWeight: FontWeight.w900,
            ),
          ),
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 32.0,
                    backgroundColor: Colors.indigo.shade400,
                    child: Icon(
                      CupertinoIcons.person,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Color(0xFF0F1826).withOpacity(0.05),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(
                          "Name",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF0F1826),
                          ),
                        ),
                        subtitle: Text(
                          "Muhammadilyas Nematjonov",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF0F1826).withOpacity(0.6)),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Color(0xFF0F1826),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Color(0xFF0F1826).withOpacity(0.05),
                ),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text(
                    "Phone number",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF0F1826),
                    ),
                  ),
                  subtitle: Text(
                    "+998946015393",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF0F1826).withOpacity(0.6)),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Color(0xFF0F1826),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Color(0xFF0F1826).withOpacity(0.05),
                ),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: Icon(
                    CupertinoIcons.sun_max_fill,
                    color: Color(0xFF0F1826),
                  ),
                  title: Text(
                    "Night Mode",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF0F1826),
                    ),
                  ),
                  trailing: CupertinoSwitch(
                    trackColor: Colors.white,
                    activeColor: Color(0xFF0F1826),
                    value: _onOff,
                    onChanged: (e) {
                      setState(() {
                        _onOff = e;
                      });
                    },
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Color(0xFF0F1826).withOpacity(0.05),
                ),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: Color(0xFF0F1826),
                  ),
                  title: Text(
                    "Notification",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF0F1826),
                    ),
                  ),
                  trailing: CupertinoSwitch(
                    trackColor: Colors.white,
                    activeColor: Color(0xFF0F1826),
                    value: _onOff2,
                    onChanged: (e) {
                      setState(() {
                        _onOff2 = e;
                      });
                    },
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Color(0xFF0F1826).withOpacity(0.05),
                ),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: Icon(
                    Icons.support_agent,
                    color: Color(0xFF0F1826),
                  ),
                  title: Text(
                    "Support",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF0F1826),
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.send_to_mobile,
                      color: Color(0xFF0F1826),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
