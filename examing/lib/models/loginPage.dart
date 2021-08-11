import 'dart:io';
import 'package:example_for_examing/models/startPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController smsCode = TextEditingController();
  String? _usernameInput;
  String? _phoneNumberInput;
  PageController _scrollController = PageController();

  String? _verificationId;

  Color rang1 = Colors.grey.shade400;

  File? _image;
  final ImagePicker _picker = ImagePicker();

  _imgFromGallery() async {
    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = File(image!.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.photo_library),
                  title: new Text('Photo Library'),
                  onTap: () {
                    _imgFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    late ImageProvider _imageWidget;
    if (_image != null) {
      _imageWidget = FileImage(_image!);
      rang1 = Colors.grey.shade400;
    } else {
      _imageWidget = AssetImage("assets/images/photoAdd.png");
      rang1 = Colors.transparent;
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: CircleAvatar(
                        backgroundImage: _imageWidget,
                        radius: 56.0,
                        backgroundColor: Colors.grey.shade200,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Welcome back!",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      "Enter the username and phone number for sing up",
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SimpleDialog(
                                      children: [
                                        TextFormField(
                                          controller: smsCode,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            prefixIcon: Icon(Icons.message),
                                            hintText: "SMS CODE",
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                          ),
                                          maxLength: 6,
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            PhoneAuthCredential
                                                phoneAuthCredential =
                                                PhoneAuthProvider
                                                    .credential(
                                                        verificationId:
                                                            _verificationId!,
                                                        smsCode: smsCode.text);
                                            await _authUser
                                                .signInWithCredential(
                                                    phoneAuthCredential);
                                            _authUser.currentUser!
                                                .updateDisplayName(
                                                    _usernameInput);

                                            await Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    StartPage(),
                                              ),
                                            );
                                          },
                                          child: Text("CONFIRM"),
                                        ),
                                      ],
                                    );
                                  });
                              _phoneVerify();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 4.0),
                              child: Text(
                                "SMS",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.yellow.shade600,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          prefixIcon: Icon(
                            CupertinoIcons.person,
                          ),
                          hintText: "Enter username...",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          prefixIcon: Icon(CupertinoIcons.phone),
                          hintText: "Enter phone number...",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30.0)),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        maxLength: 13,
                        initialValue: "+998",
                        validator: (e) {
                          if (e!.length != 13) {
                            return "Enter the phone number in full!";
                          }
                        },
                        onSaved: (e) {
                          _phoneNumberInput = e;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _phoneVerify() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_phoneNumberInput);
      try {
        _authUser.verifyPhoneNumber(
          phoneNumber: _phoneNumberInput!,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException credential) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Invalid Code!"),
              ),
            );
          },
          codeSent: (String verificationId, int? resendToken) async {
            _verificationId = verificationId;
          },
          codeAutoRetrievalTimeout: (String text) {
            print("TEXT $text");
          },
        
        );
      } catch (e) {
        print(e);
      }
    }
  }
}
