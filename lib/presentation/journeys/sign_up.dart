import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psony/presentation/widgets/combo_box.dart';
import 'package:psony/presentation/widgets/input_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _verificationId = "";
  var auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController smsCodeController = TextEditingController();
  String? genderController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inspire Community"),
        centerTitle: true,
        elevation: 0,
        leading: Container(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        color: Theme.of(context).accentColor,
        child: _verificationId == ""
            ? ListView(
                children: [
                  SizedBox(
                    height: 52,
                  ),
                  Text(
                    "Veuillez remplir ce formulaire pour appartenir à la grande famille \n Inspire",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InputField(
                    controller: nameController,
                    textHint: "Nom complet",
                    iconData: CupertinoIcons.person,
                    radius: 8,
                  ),
                  InputField(
                    controller: phoneController,
                    textHint: " phone ex: +243 99999 . . . ",
                    iconData: Icons.phone_android,
                    radius: 8,
                  ),
                  ComboBox(
                    items: ["Masculin", "Femmine"],
                    label: "Genre",
                    onChange: (String? v) {
                      setState(() {
                        genderController = v;
                      });
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          textStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                          padding: EdgeInsets.symmetric(
                            horizontal: 56,
                            vertical: 15,
                          ),
                        ),
                        onPressed: () async {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: '+44 7123 123 456',
                            verificationCompleted:
                                (PhoneAuthCredential credential) async {
                              await auth.signInWithCredential(credential);
                            },
                            verificationFailed: (FirebaseAuthException e) {
                              print(e.message);
                            },
                            codeSent:
                                (String verificationId, int? resendToken) {
                              setState(() {
                                _verificationId = verificationId;
                              });
                            },
                            codeAutoRetrievalTimeout: (String verificationId) {
                              setState(() {
                                _verificationId = verificationId;
                              });
                            },
                          );
                        },
                        child: Text("Rejoindre"),
                      ),
                    ),
                  ),
                ],
              )
            : verificationSMS(),
      ),
    );
  }

  Widget verificationSMS() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 72,
          ),
          InputField(
            iconData: CupertinoIcons.number,
            keyboard: TextInputType.number,
            textHint: "SMS code",
            controller: smsCodeController,
          ),
        ],
      ),
    );
  }
}
